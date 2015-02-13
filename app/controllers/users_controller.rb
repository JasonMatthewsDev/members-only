class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.create(user_params)
    if @user.save
      log_in @user
      redirect_back_or @user
    else
      render 'new'
    end
  end
  
  def show
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
