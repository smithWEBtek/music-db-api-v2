class CreateResources < ActiveRecord::Migration[6.0]
  def change
    create_table :resources do |t|
      t.integer :song_id
      t.string :name
      t.string :location
      t.string :description
      t.string :format
 
      t.timestamps
    end
  end
end
