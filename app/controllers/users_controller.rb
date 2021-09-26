class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.where(user_id: @user.id)
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end


  def create
    flash[:notice] = "Signed in successfully."
    flash[:notice] = "Welcome! You have signed up successfully"

  end



  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
    redirect_to user_path(current_user)
    end
  end

  def update
    @books = Book.all
    flash[:notice] = "You have updated user successfully."
    @user = User.find(params[:id])
    @user.id = current_user.id
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end


  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
