class ApplicationController < ActionController::API
  include ActionController::RequestForgeryProtection
  before_filter :add_allow_credentials_headers

  protect_from_forgery with: :null_session

  def authenticate_user_from_token
  	token = request.headers["token"].presence
  	user = token && User.find_by_authentication_token(token.to_s)
  	if user
  		sign_in user, store: false
  	end
  end

  def add_allow_credentials_headers
  # https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS#section_5
  #
  # Because we want our front-end to send cookies to allow the API to be authenticated
  # (using 'withCredentials' in the XMLHttpRequest), we need to add some headers so
  # the browser will not reject the response
  response.headers['Access-Control-Allow-Origin'] = '*'
  response.headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
  response.headers['Access-Control-Request-Method'] = '*'
  response.headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'

  response.headers['Access-Control-Allow-Origin'] = request.headers['Origin'] || '*'
  response.headers['Access-Control-Allow-Credentials'] = 'true'
  end
  def options
  head :status => 200, :'Access-Control-Allow-Headers' => 'accept, content-type'
  end
end
