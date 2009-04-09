require 'digest/md5'

class Image < ActiveRecord::Base
	belongs_to :images_category

	attr_accessor :data

	def before_save
		self.filename = Digest::MD5.hexdigest(Time.now.to_i.to_s) + File.extname(self.data.original_filename)
	end

	def after_save
		image_path = GALLERY_DIR + self.filename
		image_thumbnail_path = GALLERY_THUMBNAIL_DIR + self.filename

		File.open(image_path, "w") do | f |
			f.write(self.data.read)
		end
		
		# create thumbnail
		command = "convert #{image_path} -resize x200 -resize '200x<' -resize 50% -gravity center -crop 100x100+0+0 +repage #{image_thumbnail_path}"
		system(command)
	end

	def after_destroy
		File.delete(GALLERY_DIR + self.filename)
		File.delete(GALLERY_THUMBNAIL_DIR + self.filename)
	end

	def url
		"/images/gallery/" + self.filename
	end

	def thumbnail_url
		"/images/gallery/thumbnail/" + self.filename
	end

end
