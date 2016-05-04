class Fix < ActiveRecord::Migration
  	def self.up
  		remove_column :albums, :genere_id
  		add_column :albums, :genre_id, :integer
	end
end
