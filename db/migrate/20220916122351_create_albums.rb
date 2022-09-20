class CreateAlbums < ActiveRecord::Migration[6.1]
  def change
    create_table :albums do |t|
      t.belongs_to :artist, index: true,foreign_key: true 
      t.string :title
      t.string :genre
      t.integer :release

      t.timestamps
    end
  end
end
