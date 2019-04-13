class BooksController < ApplicationController

  def top
  end

  def about
  end

  def show
  	@book = Book.find(params[:id])
    @books = Book.new
  end

  def index
    @user = current_user
  	@book = Book.new
  	@books = Book.all
  end

  def new
  	@book = Book.new
  end

  def create
  	book = Book.new(book_params)
    if book.user_id = current_user.id
      	if book.save
      	  flash[:notice] = "Book was successfully created!"
          redirect_to book_path(book)
        else
          flash[:danger] = "error! It can't be blank!"
          redirect_to books_path(book)
      	end
    end
  end

  def edit
  	@book = Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to book_path(@book)
    end
  end

  def update
  	book = Book.find(params[:id])
  	if book.update(book_params)
      flash[:notice] = "Book was successfully updated!"
  	  redirect_to book_path(book)
    else
      flash[:danger] = "error!"
      redirect_to books_path(book)
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:notice] = "Book was successfully destroyed!"
      redirect_to books_path
    end
  end

  private

  def book_params
  	params.require(:book).permit(:title, :category, :user, :caption)
  end
end
