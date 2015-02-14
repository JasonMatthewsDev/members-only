module SessionsHelper
  
  def log_in(user)
    session[:id] = user.id  
  end
  
  def log_out
    session.delete(:id)
    cookies.delete(:user_id)
    cookies.delete(:remember_digest)
    @current_user = nil
  end
  
  def current_user
    if (user_id = session[:id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && create_digest(cookies[:remember_digest]) == user.remember_digest
        log_in(user)
        @current_user = user
      end
    end
  end
  
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end
  
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
  
  def logged_in?
    !current_user.nil?
  end

  def create_digest(str)
    Digest::SHA1.hexdigest(str)
  end
end
