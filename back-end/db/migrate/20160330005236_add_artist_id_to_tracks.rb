class AddArtistIdToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :artist_id, :integer
    add_index :tracks, :artist_id
  end
end
