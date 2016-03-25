class SessionsController < Devise::SessionsController

	def create
		user = User.find_for_database_authentication(email: params[:email])
		if user && user.valid_password?(params[:password])
		token = user.ensure_authentication_token
		render json: {auth_token: token}
		else 
		render nothing: true, status: :unauthorized
		end
	end

end