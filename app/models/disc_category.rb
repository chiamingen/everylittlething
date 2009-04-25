class DiscCategory < ActiveRecord::Base
	has_many :discs, :dependent => :destroy
	validates_presence_of :name
end
