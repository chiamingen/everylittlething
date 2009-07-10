class Disc < ActiveRecord::Base
	has_many :songs, :dependent => :destroy
	has_many :images, :as => :imageable, :dependent => :destroy

	accepts_nested_attributes_for :songs, :allow_destroy => true, :reject_if => proc { | attributes | attributes['name'].blank? }

	validates_presence_of :name

	def cover_img_url
		if @images.empty?
			'/images/gallery/empty.jpg'
		else
			"/images/gallery/thumbnail/" + self.images.first.filename
		end
	end

	def paginated_images(page)
		Image.paginate :per_page => 20, :page => page, :conditions => ["imageable_id = ? AND imageable_type = 'Disc'", self.id]
	end
end
