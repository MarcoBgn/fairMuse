class RemoveUrlFromTrack < ActiveRecord::Migration
  def self.up
      remove_column :tracks, :url
    end

    def self.down
      add_column :tracks, :url, :string
    end
end
