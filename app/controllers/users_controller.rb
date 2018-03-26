class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_user

  def mypage
    @book = Book.new
    @user = current_user
    @books = @user.books
  end

  def index
    @user = current_user 
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to books_path(@user)
  end

  def view
    @user = User.find(params[:id])
    @books = @user.books
  end

  private 
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def require_user
    @book = Book.new
  end
end

