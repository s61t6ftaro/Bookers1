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
      flash[:success] = "Book was successfully created."
      redirect_to post_path(book.id)
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  def update
    flash[:success] = "Book was successfully updated."
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to update_path
  end
  def destroy
      book = Book.find(params[:id])
      book.destroy
      flash[:delete] = "Book was successfully destroyed."
      redirect_to books_path  
  end
  private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end

