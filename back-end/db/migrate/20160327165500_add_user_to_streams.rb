class AddUserToStreams < ActiveRecord::Migration
  def change
    add_reference :streams, :user, index: true, foreign_key: true
  end
end
