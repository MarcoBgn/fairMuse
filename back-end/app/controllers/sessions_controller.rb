class SessionsController < Devise::SessionsController

	def create
		user = User.find_for_database_authentication(email: params[:email])
		if user && user.valid_password?(params:[:password])
		else 
		render nothing: true, status: :unauthorized
		end
	end

end