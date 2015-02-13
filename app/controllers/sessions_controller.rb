class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:id] = user.id
      redirect_back_or user
    else
      flash.now[:danger] = 'Incorrect name and password combination!'
      render 'new'
    end
  end
  
  def destroy
  end
end
