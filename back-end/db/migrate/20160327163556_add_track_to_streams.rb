class AddTrackToStreams < ActiveRecord::Migration
  def change
    add_reference :streams, :track, index: true, foreign_key: true
  end
end
