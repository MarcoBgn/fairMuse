class SessionsController < Devise::SessionsController

  before_filter :authenticate_user_from_token!, except: [:create]

  def create
    user = get_user
    if user && user.valid_password?(params[:password])
      token = user.ensure_authentication_token
      render json: {auth_token: token, user_id: user.id, is_user: params[:user]}
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
    if params[:user]
      return User.find_for_database_authentication(email: params[:email])
    else
      return Artist.find_for_database_authentication(email: params[:email])
    end
  end


end
