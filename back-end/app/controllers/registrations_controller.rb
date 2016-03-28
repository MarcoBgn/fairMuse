class RegistrationsController < Devise::RegistrationsController

	def create
		user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
		if user
			token = user.ensure_authentication_token
			render json: {auth_token: token}
		else
			render nothing: true, status: 422
		end
	end

end
