class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.belongs_to :user
      t.timestamps null: false
      t.boolean :artist, default: false
      t.boolean :subscriber, default: false
    end
    add_index :roles, :user_id, :unique => true
  end
end
