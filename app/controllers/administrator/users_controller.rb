class Administrator::UsersController < ApplicationController
  before_action :admin_user
  
  def index
    @users = User.all.order(created_at: :desc)
  end
  
  def show 
    @user = User.find(params[:id])
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = 'ユーザを削除しました。'
    redirect_to administrator_users_url
  end
  
  private
  
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
  
end
