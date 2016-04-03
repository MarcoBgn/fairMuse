class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name
      t.string :url
      t.string :genre

      t.timestamps null: false
    end
  end
end
