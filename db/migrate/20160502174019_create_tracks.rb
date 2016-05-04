class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :album_id
      t.string :t_name

      t.timestamps null: false
    end
  end
end
