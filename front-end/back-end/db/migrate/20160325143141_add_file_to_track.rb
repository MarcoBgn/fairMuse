class AddFileToTrack < ActiveRecord::Migration
  def self.up
      add_attachment :tracks, :file
    end

    def self.down
      remove_attachment :tracks, :file
    end
end
