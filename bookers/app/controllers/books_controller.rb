class BooksController < ApplicationController
  def index
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    #DB上の全てのデータを@postsに格納
    @books = Book.all
    @book = Book.new
    render 'new' #escape error "First argument in form cannot contain nil or be empty"
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    #ストロングパラメーターを使用
    book = Book.new(book_params)
    #DBへ保存する
    book.save
    redirect_to book_path(book.id)
    flash[:message] = "Book was successfully created."
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    #redirect_to '/books/#{book.id}'
    redirect_to book_path(book.id) #名前付きルートに変更
    flash[:message] = "Book was successfully updated."
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to new_book_path
    flash[:message] = "Book was successfully destroyed."
  end

  private
    def book_params
      params.require(:book).permit(:title,:body)
    end
end
