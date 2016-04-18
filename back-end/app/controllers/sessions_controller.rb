class SessionsController < Devise::SessionsController
puts "are we getting here....controller"
  before_filter :authenticate_user_from_token!, except: [:create]
  prepend_before_filter :require_no_authentication, :only => [ :destroy ]

  def create
    user = User.find_for_database_authentication(email: params[:email])
    if user && user.valid_password?(params[:password])
      token = user.ensure_authentication_token
      render json: {auth_token: token, user_id: user.id, is_user: true}
    else
      render nothing: true, status: :unauthorized
    end
  end

  def destroy
    puts "are we getting here...."
    current_user.authentication_token = nil
    current_user.save
    render json: {message: 'message' }
  end

  def session_user
    session[:user] = current_user
  end
end
