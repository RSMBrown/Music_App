class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.belongs_to :album, index: true, foreign_key: true 
      t.string :subject
      t.decimal :rhythm, :precision => 4, :scale => 2

      t.timestamps
    end
  end
end
