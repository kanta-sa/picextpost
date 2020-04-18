class Administrator::MicropostsController < ApplicationController
  before_action :admin_user
  
  def index
    @microposts = current_user.microposts
  end 
  
  def new
    @micropost = current_user.microposts.build
  end
  
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render :new
    end
  end
  
  def destroy
    @micropost = current_user.microposts.find(params[:id])
    @micropost.destroy
    
    flash[:success] = 'お知らせは正常に削除されました。'
    redirect_to root_url
  end
  
  private
  
  def micropost_params
    params.require(:micropost).permit(:content)
  end
  
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
