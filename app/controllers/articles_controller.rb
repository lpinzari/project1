class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :check_for_login, except: [:index, :show, :edit, :update]
  before_action :require_same_user, only: [:edit, :update]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = @current_user
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article was successfully deleted"
    redirect_to articles_path
  end

  private
  def set_article
    @article = Article.find_by_id(params[:id])
  end

  def article_params
    params.require(:article).permit(:title,:description, :id, :name, :category_ids => [])
  end

  def require_same_user
    if @current_user != @article.user and !@current_user.admin?
      redirect_to login_path
    end
  end

end
