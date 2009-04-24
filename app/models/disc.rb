class Disc < ActiveRecord::Base
	has_and_belongs_to_many :songs
	has_many :images, :as => :imageable

	accepts_nested_attributes_for :songs, :allow_destroy => true, :reject_if => proc { | attributes | attributes['name'].blank? }

	validates_presence_of :name

	def cover_img_url
		if @images.empty?
			'/images/gallery/empty.jpg'
		else
			"/images/gallery/thumbnail/" + self.images.first.filename
		end
	end
end
