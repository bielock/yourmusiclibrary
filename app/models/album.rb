class Album < ActiveRecord::Base
	belongs_to :artist
	belongs_to :genre
	belongs_to :user
	has_many :tracks
	
end
