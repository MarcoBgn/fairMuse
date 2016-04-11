class ArtistregController < Devise::RegistrationsController

  def create
    artist = Artist.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if artist.save
      token = artist.ensure_authentication_token
      render json: {name: artist.name, auth_token: token, artist_id: artist.id, is_artist: true}
    else
      render json: {messages: artist.errors.full_messages}, status: 422    end
  end
end
