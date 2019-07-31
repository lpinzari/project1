class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  # before_action :check_for_login, :only => [:edit, :update]
  before_action :check_for_login, except: [:index, :show, :edit, :update, :new, :create]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]

  def index
    # @users = User.all
    @users = User.paginate(page: params[:page], per_page: 3)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if params[:file].present?
      # Then call Cloudinary's upload method, passing in the file in params
      req = Cloudinary::Uploader.upload(params[:file])
      # Using the public_id allows us to use Cloudinary's powerful image
      # transformation methods.
      @user.image = req["public_id"]
      @user.save
    end

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the Agora Blog #{@user.username}"
      redirect_to user_path(@user)
    else
      render 'new'
    end

  end

  def edit
  end

  def update

    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      @user.image = req["public_id"]
    end
      @user.update user_params
      @user.save

    if @user.update(user_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def show
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "User and all articles created by user have been deleted"
    redirect_to users_path
  end


  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find_by_id(params[:id])
  end

  def require_same_user
    if @current_user != @user and !@current_user.admin?
      redirect_to login_path
    end
  end

  def require_admin
    if @current_user.present? and !@current_user.admin?
      flash[:danger] = "Only admin users can perform this operation"
      redirect_to login_path
    end
  end

end
