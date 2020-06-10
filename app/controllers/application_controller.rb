class ApplicationController < ActionController::Base
  include SessionsHelper
  
  private #アクションではない関数を以下に定義する
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def counts(user)
    @count_microposts = user.microposts.count
    @count_followings = user.followings.count
    @count_followers = user.followers.count
    
    #お気に入り用
    @count_favorites = user.favorite_of_microposts.count
  end
end
