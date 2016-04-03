class ApplicationController < ActionController::Base
  include ActionController::RequestForgeryProtection

  protect_from_forgery with: :null_session

  def authenticate_user_from_token
    token = request.headers["token"].presence
    user = token && User.find_by_authentication_token(token.to_s)
    if user
      sign_in user, store: false
    end
  end
end

