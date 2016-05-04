class AddColumn < ActiveRecord::Migration
  	def self.up
  		add_column :albums, :genere_id, :integer
	end
end
