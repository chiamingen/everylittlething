class ImageCategory < ActiveRecord::Base
	has_many :images, :dependent => :destroy, :as => :imageable
	belongs_to :artist

	validates_presence_of :name

	def thumbnail_url
		if @images.empty?
			'/images/gallery/empty.jpg'
		else
			@images.first.thumbnail_url
		end
	end
			

	def paginated_images(page)
		Image.paginate :per_page => 20, :page => page, :conditions => ["imageable_id = ? AND imageable_type = 'ImageCategory'", self.id]
	end
end
