class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.belongs_to :song, index: {unique: true}, foreign_key: true 
      t.integer :evaluation 

      t.timestamps
    end
  end
end
