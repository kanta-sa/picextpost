class MicropostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def new
    if logged_in?
      @micropost = current_user.microposts.build #form_with用
    end
  end
  
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  def timeline
    @microposts = current_user.feed_microposts.order(id: :desc).page(params[:page])
  end
  
  private
  
  def micropost_params
    params.require(:micropost).permit(:content, :image)
  end
  
  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    unless @micropost
      redirect_to root_url #4/16現在、ユーザの投稿はトップページに表示されている
    end
  end
end
