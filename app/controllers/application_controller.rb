class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= Chef.find(session[:chef_id]) if session[:chef_id]
  end

  def logged_in?
     !!current_user
  end 

  def require_user
   if !logged_in?
   	flash[:danger] = "You must be Log in"
   	redirect_to back
  end
 end

end
