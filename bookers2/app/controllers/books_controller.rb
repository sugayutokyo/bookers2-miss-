class BooksController < ApplicationController
  def new

  end

  def welcome
  end

  def index
    @book = Book.new
    @user = current_user
    @books = @user.books
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
  end

  def create
    user = current_user
    book = Book.new(book_params)
    book.user_id = user.id
    book.save
    redirect_to books_path(book)
  end

  def total
    @books = Book.all
    @book= Book.new
    @user = current_user
  end

  def edit
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_total_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :opinion)
  end
end
