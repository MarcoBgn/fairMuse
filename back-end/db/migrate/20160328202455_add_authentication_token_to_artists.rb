class AddAuthenticationTokenToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :authentication_token, :string
  end
end
