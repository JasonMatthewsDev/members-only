module SessionsHelper
  
  def log_in(user)
    session[:id] = user.id  
  end
  
  def log_out
    session[:id] = nil  
  end
  
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end
  
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end
