class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    render 'new'
  end

  def create
    Book.create!(title: book_params['title'], author: book_params['author'])
    redirect_to action: 'index'
  end

  def destroy
    Book.find(params['id']).delete
    redirect_to action: 'index'
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
