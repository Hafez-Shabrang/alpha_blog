class UsersController < ApplicationController

  before_action :require_user, only: [:show, :edit, :update, :destroy]
  before_action :find_user_by_id, only: [:show, :edit, :update, :destroy]
  before_action :user_params, only: [:create, :update]

  def index
    @users = User.all.page(params[:page])
  end

  def show
    @articles = @user.articles
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User has been created successfully"
      session[:user_id] = @user.id
      redirect_to signin_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "User has been updated successfully"
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      session[:user_id] = nil
      flash[:success] = "User has been deleted successfully"
      redirect_to articles_path
    end
  end

  private

    def find_user_by_id
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

end
