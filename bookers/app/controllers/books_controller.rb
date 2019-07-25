class BooksController < ApplicationController
  def top
  end

  def index
    @books = Book.order(:created_at, :id)
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save
    flash[:success] = "successfully"
    redirect_to book_path(book.id)
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  def update
    flash[:success] = "successfully"
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path
  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:delete] = "successfully"
    redirect_to books_path  
  end
  private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end

