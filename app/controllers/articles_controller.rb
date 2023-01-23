class ArticlesController < ApplicationController

  before_action :require_user, only: [:show, :edit, :new, :create, :update, :destroy]
  before_action :article_find_by_id, only: [:show, :edit, :update, :destroy]
  before_action :article_params, only: [:create, :update]

  def index
    @articles = Article.all.page(params[:page])
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:success] = "Article has been created successfully"
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:success] = "Article has been edited successfully"
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @article.destroy
      flash[:success] = "Article has been deleted successfully"
      redirect_to articles_path
    end
  end

  private

    def article_find_by_id
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :description, category_ids: [])
    end

end