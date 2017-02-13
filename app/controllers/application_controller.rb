class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?
  #rails is going to make these two availale to our viewers
  
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
# if session[:user_id] is true, not nil, available set @current_user else nil
#Current user to check if the user is logged in
  end
  
  def logged_in?
    !!current_user
  end
  
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end
end

#These methods help us thoughout the program

