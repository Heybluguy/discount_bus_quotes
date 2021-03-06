class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def check_user
    redirect_to root_path if !current_user
  end

  def current_admin?
    current_user && current_user.admin?
  end

end
