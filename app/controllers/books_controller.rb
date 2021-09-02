class BooksController < ApplicationController
  def index
    @user = current_user
    @books = Book.page(params[:page]).reverse_order
    @book = Book.new
  end

  def show
    @book1=Book.find(params[:id])
    @book=Book.new
    @user = User.find(current_user.id)
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice]="You have creatad book successfully."
      redirect_to book_path(@book)
    else
      @user = current_user
      @books = Book.page(params[:page]).reverse_order
      render :index
    end
  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book), notice: 'successfully'
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
      params.require(:book).permit(:title, :body)
  end
end
