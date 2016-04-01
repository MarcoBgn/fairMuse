class ArtistsessionsController < Devise::SessionsController
  before_filter :authenticate_user_from_token!, except: [:create]

  def create
    artist = Artist.find_for_database_authentication(email: params[:email])
    if artist && artist.valid_password?(params[:password])
      token = artist.ensure_authentication_token
      render json: {name: artist.name, auth_token: token, artist_id: artist.id, is_artist: true}
    else
      render nothing: true, status: :unauthorized
    end
  end

  def destroy
    current_user.authentication_token = nil
    current_user.save
    render json: {message: 'message' }
  end
end