require 'digest/md5'

class Image < ActiveRecord::Base
	belongs_to :images_category

	attr_accessor :data

	def before_create
		self.filename = Digest::MD5.hexdigest(Time.now.to_i.to_s) + File.extname(self.data.original_filename)
	end

	def after_create
		image_path = GALLERY_DIR + self.filename
		image_thumbnail_path = GALLERY_THUMBNAIL_DIR + self.filename

		File.open(image_path, "w") do | f |
			f.write(self.data.read)
		end
		
		# create thumbnail
		command = "convert #{image_path} -resize x250 -resize '250x<' -resize 50% -gravity center -crop 125x125+0+0 +repage #{image_thumbnail_path}"
		system(command)
	end

	def after_destroy
		begin
			File.delete(GALLERY_DIR + self.filename)
			File.delete(GALLERY_THUMBNAIL_DIR + self.filename)
		rescue
		end
	end

	def url
		"/images/gallery/" + self.filename
	end

	def thumbnail_url
		"/images/gallery/thumbnail/" + self.filename
	end

end
