class ImageCategory < ActiveRecord::Base
	has_many :images, :dependent => :destroy
	belongs_to :artist
end
