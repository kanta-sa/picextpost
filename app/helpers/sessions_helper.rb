module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def guest_user
    @guest_user ||= User.find_by(email: 'test@example.com')
  end
  
  def logged_in?
    !!current_user
  end
end
