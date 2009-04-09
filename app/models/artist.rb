class Artist < ActiveRecord::Base
	has_many :image_categories
end
