class CategoriesController < ApplicationController

  before_action :find_category_by_id, only: [:show, :edit, :update, :destroy]
  before_action :category_params, only: [:create, :update]

  def index
    @categories = Category.all
  end

  def show

  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category has been created successfully"
      redirect_to @category
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @category.update(category_params)
      flash[:success] = "Category has been updated successfully"
      redirect_to @category
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = "Category has been deleted successfully"
      redirect_to categories_path
    end
  end


  private

    def find_category_by_id
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end

end
