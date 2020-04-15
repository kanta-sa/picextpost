class ToppagesController < ApplicationController
  def index
    if logged_in?
      @users = User.all
      @microposts = current_user.microposts.order(id: :desc).page(params[:page]) #form_with用
    end
  end
end