class GuestSessionsController < ApplicationController
  def create
    @user = User.find_by(email: 'test@example.com')
    log_in(@user)
    flash[:success] = 'ゲストユーザーでログインしました'
    flash[:warning] = 'よろしくお願いします！'
    redirect_to user_path(@user)
  end
end
