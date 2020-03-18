class CreateSongCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :song_collections do |t|
      t.integer :song_id
      t.integer :collection_id

      t.timestamps
    end
  end
end
