class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      params[:session][:remember_me] == '1' ? remember_me(user) : forget_me(user)
      session[:id] = user.id
      redirect_back_or user
    else
      flash.now[:danger] = 'Incorrect name and password combination!'
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
  
  private
    
    def remember_me(user)
      remember_digest = SecureRandom.urlsafe_base64
      
      user.remember_digest = create_digest(remember_digest)
      user.save
      
      cookies.permanent.signed[:user_id] = user.id
      cookies.permanent[:remember_digest] = remember_digest
    end
  
    def forget_me(user)
      user.remember_digest = ''
      user.save
      
      cookies.delete(:user_id)
      cookies.delete(:remember_digest)
    end
end
