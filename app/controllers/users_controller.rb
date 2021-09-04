class UsersController < ApplicationController
  def index
    @users = User.all
    @book = Book.new
    @user = User.find(current_user.id)
  end

  def show
    @book=Book.new
    @user=User.find(params[:id])
    @books = @user.books
  end


  def edit
   @user=User.find(params[:id])
   if @user!=current_user
     redirect_to user_path(current_user)
   end

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id),notice: 'successfully'
    else
      render :edit
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
