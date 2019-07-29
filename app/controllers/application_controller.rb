class ApplicationController < ActionController::Base

  before_action :fetch_user

  private
  # Set up a @user instance variable if we can find a user_id in this session
  def fetch_user
    @current_user = User.find_by :id => session[:user_id] if session[:user_id].present?
    session[:user_id] = nil unless @current_user.present?
  end

  def check_for_login
    if @article != nil
      redirect_to login_path unless ( @current_user.present? && @current_user == @article.user )
    else @user != nil
      redirect_to login_path unless ( @current_user.present? && @current_user == @user )
    end 
  end


end
