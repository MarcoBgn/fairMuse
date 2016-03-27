class AddPlaysCountersToStreams < ActiveRecord::Migration
  def change
    add_column :streams, :total_plays, :integer
    add_column :streams, :weekly_plays, :integer
  end
end
