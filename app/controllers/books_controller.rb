class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :create, :edit, :destroy]
  def new
  end

  def welcome
  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @user = current_user
    @nowuser = @book.user
  end

  def create
    user = current_user
    book = Book.new(book_params)
    book.user_id = user.id
    book.save
    redirect_to books_path(book)
  end

  def index
    @books = Book.all
    @book= Book.new
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
    else
      # /book/id/editを打ってもログインユーザーと一致していない限りedit画面には飛べないでedit画面に戻されてしまう
      redirect_to book_path(@book)
    end

  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_total_path
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
  end

  def about
  end

  private
  def book_params
    params.require(:book).permit(:title, :opinion)
  end
end
