class BooksController < ApplicationController
  def new

  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to book_path(book)
  end

  def edit
  end

  private
  def book_params
    params.require(:book).permit(:title, :opinion)
  end
end
