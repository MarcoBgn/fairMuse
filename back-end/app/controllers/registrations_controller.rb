class RegistrationsController < Devise::RegistrationsController

  def create
    user = new_account
    user.save ? success_message(user) : failure_message(user)
  end

  private
  def new_account
    if params[:user]
      return User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    else
      return Artist.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    end
  end

  def success_message(user)
    token = user.ensure_authentication_token
    render json: {auth_token: token, user_id: user.id, is_user: params[:user], is_artist: !params[:user]}
  end
  def failure_message(user)
    render json: {messages: user.errors.full_messages}, status: 422
  end
end
