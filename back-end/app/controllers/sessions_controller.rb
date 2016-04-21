class SessionsController < Devise::SessionsController

  before_filter :authenticate_user_from_token!, except: [:create]

  def create
    user = get_user
    if user && user.valid_password?(params[:password])
      token = user.ensure_authentication_token
      role = user.role
      render json: {auth_token: token, user_id: user.id, name: user.name, is_subscriber: role.subscriber, is_artist: role.artist}
    else
      render nothing: true, status: :unauthorized
    end
  end

  def destroy
    current_user.authentication_token = nil
    current_user.save
    render json: {message: 'message' }
  end

  def session_user
    session[:user] = current_user
  end

  private
  def get_user
    User.find_for_database_authentication(email: params[:email])
  end


end
