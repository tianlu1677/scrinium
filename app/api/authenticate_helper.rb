module AuthenticateHelper

  def session
    env[Rack::Session::Abstract::ENV_SESSION_KEY]
  end

  def authenticate!
    error!({error_code: 401, error_message: "401 Unauthorized"},401) unless authenticated
  end

  def warden
    env['warden']
  end

  def authenticated
    return true if warden.authenticated?
    params[:access_token] && @user = User.find_by_authentication_token(params[:access_token])
  end

  def current_user
    warden.user || @user
  end
end