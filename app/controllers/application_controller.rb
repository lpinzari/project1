class ApplicationController < ActionController::Base

  before_action :fetch_user

  private
  # Set up a @user instance variable if we can find a user_id in this session
  def fetch_user
    @current_user = User.find_by :id => session[:user_id] if session[:user_id].present?
    session[:user_id] = nil unless @current_user.present?
  end

  def check_for_login
    redirect_to login_path unless @current_user.present?
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You need to be logged in to perform that action"
      redirect_to root_path
    end
  end
  
end
