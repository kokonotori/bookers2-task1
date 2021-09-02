class UsersController < ApplicationController
  def index
    @users = User.all
    @book = Book.new
    @user = User.find(current_user.id)
    @books = Book.page(params[:page]).reverse_order
  end

  def show
    @book=Book.new
    @user=User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
  end


  def edit
    @user=User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id),notice: 'successfully'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
