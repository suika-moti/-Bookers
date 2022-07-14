class BooksController < ApplicationController
  def top
    @book =Book.new

    @books = Book.all
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy(book_params)
    redirect_to "/books"
  end


  def index
    @books = Book.all
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
