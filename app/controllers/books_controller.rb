class BooksController < ApplicationController
  def top
    @book =Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end

  def index
    @book = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end

  def show
    @book =Book.find(params[:id])
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
