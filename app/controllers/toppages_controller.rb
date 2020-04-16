class ToppagesController < ApplicationController
  def index
    @users = User.all
    #@microposts = current_user.microposts.order(id: :desc).page(params[:page]) 
    @favorite_ranks = Micropost.find(Favorite.group(:micropost_id).order('count(micropost_id) desc').limit(3).pluck(:micropost_id))
    @follower_ranks = User.find(Relationship.group(:follow_id).order('count(follow_id) desc').limit(3).pluck(:follow_id))
  end
end