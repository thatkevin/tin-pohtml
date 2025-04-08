class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :set_current_user
  
  helper_method :current_user, :logged_in?
  
  private
  
  def set_current_user
    return unless session[:user_id]
    @current_user = User.find_by(id: session[:user_id])
  end
  
  def current_user
    @current_user
  end
  
  def logged_in?
    current_user.present?
  end
  
  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_path
    end
  end
  
  def require_admin
    unless logged_in? && current_user.admin?
      flash[:error] = "You don't have permission to access this section"
      redirect_to root_path
    end
  end
end