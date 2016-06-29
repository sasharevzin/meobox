class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

# create an instance variable that if a session variable "user_id"  exists, 
# will return the correspond user and assign it to the that variable.
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  
  def require_signin
    unless current_user
      session[:intended_url] = request.url
      redirect_to new_session_url, alert: "Please sign in first!"
    end
  end
  helper_method :require_signin

  def current_user?(user)
    current_user == user
  end

  helper_method :current_user?
 
end
