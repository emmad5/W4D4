class ApplicationController < ActionController::Base

helper_method :current_user
# should logged_in? be a helper method as well??

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login!(user)
    @current_user = user
    session[:session_token] = user.reset_session_token!
  end

  def logged_in?
    !!current_user
  end

  def logout!
    session[:session_token] = nil
    if current_user
      @current_user.reset_session_token!
      @current_user = nil
    end
  end

  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end


end
