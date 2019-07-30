class CategoriesController < ApplicationController
  before_action :require_admin, except: [:index, :show]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    # @category = Category.create :name => "History"
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category was successfully created"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = "Category name was updated successfully"
      redirect_to category_path(@category)
    else
      render 'edit'
    end
  end


  def show
    @category = Category.find(params[:id])
  end

  private

  def category_params
    params.require(:category).permit(:title,:name)
  end

  def require_admin
    if @current_user.present? and !@current_user.admin?
      flash[:danger] = "Only admin users can perform this operation"
      redirect_to categories_path
    end
  end

end
