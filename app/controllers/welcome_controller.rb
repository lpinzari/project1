class WelcomeController < ApplicationController

  def home
    redirect_to articles_path if @current_user.present?
  end

  def about
  end

end
