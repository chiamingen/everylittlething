class ImageCategory < ActiveRecord::Base
	has_many :images, :dependent => :destroy
	belongs_to :artist

	def thumbnail_url
		if @images.empty?
			'/images/gallery/empty.jpg'
		else
			@images.first.thumbnail_url
		end
	end
			
end
