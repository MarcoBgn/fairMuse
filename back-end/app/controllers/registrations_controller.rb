class RegistrationsController < Devise::RegistrationsController

  def create
    user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if user.save
      token = user.ensure_authentication_token
      render json: {auth_token: token}
    else
      # warden.custom_failure!
      render json: {messages: user.errors.full_messages}, status: 422
    end
  end

end
