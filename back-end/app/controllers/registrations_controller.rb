class RegistrationsController < Devise::RegistrationsController

  def create
    account_creation ? success_message : failure_message
  end

  private
  def account_creation
    if params[:user]
      user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
      return user.save
    else
      artist = Artist.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
      return artist.save
    token = user.ensure_authentication_token
    render json: {auth_token: token, user_id: user.id, is_user: params[:user], is_artist: !params[:user]}
  else
    render json: {messages: user.errors.full_messages}, status: 422
  end

  def success_message
  end
  def failure_message
  end
end
