class RegistrationsController < Devise::RegistrationsController

  def create
    user = new_account
    user.save ? success_message(user) : failure_message(user)
  end

  private
  def new_account
      return User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
  end

  def success_message(user)
    role = Role.create(user_id: user.id)
    p "=======#{role}====#{role.user_id}"
    token = user.ensure_authentication_token
    render json: {auth_token: token, name:user.name, user_id: user.id, is_subscriber: role.subscriber, is_artist: role.artist}
  end
  def failure_message(user)
    render json: {messages: user.errors.full_messages}, status: 422
  end
end
