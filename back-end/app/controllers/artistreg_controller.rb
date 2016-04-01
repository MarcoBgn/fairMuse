class ArtistregController < Devise::RegistrationsController

  def create
    artist = Artist.create(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if artist
      token = artist.ensure_authentication_token
      render json: {name: artist.name, auth_token: token, artist_id: artist.id, is_artist: true}
    else
      render nothing: true, status: 422
    end
  end
end
