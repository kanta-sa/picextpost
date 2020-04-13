class ApplicationController < ActionController::Base
  include SessionsHelper
  
  private #アクションではない関数を以下に定義する
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
end
