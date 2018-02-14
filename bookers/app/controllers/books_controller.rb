class BooksController < ApplicationController
  def index
    @book = Book.new
  end

  def show
    @book = Book.new
  end

  def new
    @book = Book.new
    render 'new' #escape error "First argument in form cannot contain nil or be empty"
  end

  def edit
  end
end
