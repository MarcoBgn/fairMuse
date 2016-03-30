class AddBalanceToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :balance, :integer
  end
end
