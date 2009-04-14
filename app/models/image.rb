require 'digest/md5'

class Image < ActiveRecord::Base
	belongs_to :images_category

	attr_accessor :data

	def before_create
		self.filename = Digest::MD5.hexdigest(Time.now.to_i.to_s) + File.extname(self.data.original_filename)
	end

	def after_create
		image_path = File.join(GALLERY_DIR, self.filename)
		image_thumbnail_path = File.join(GALLERY_THUMBNAIL_DIR, self.filename)

		File.open(image_path, "w") do | f |
			f.write(self.data.read)
		end
		
		# create thumbnail
		command = "convert #{image_path} -resize x250 -resize '250x<' -resize 50% -gravity center -crop 125x125+0+0 +repage #{image_thumbnail_path}"
		system(command)
	end

	def after_destroy
		File.delete(File.join(GALLERY_DIR, self.filename))
		File.delete(File.join(GALLERY_THUMBNAIL_DIR, self.filename))
	end

	def url
		"/images/gallery/" + self.filename
	end

	def thumbnail_url
		"/images/gallery/thumbnail/" + self.filename
	end

end
