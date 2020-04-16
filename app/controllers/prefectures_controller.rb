class PrefecturesController < ApplicationController
  def index
    @prefectures_a = Prefecture.where(:id => 1..7)
    @prefectures_b = Prefecture.where(:id => 8..14)
    @prefectures_c = Prefecture.where('(id=?) or (id=?) or (id=?)', 15, 19, 20)
    @prefectures_d = Prefecture.where(:id => 21..24)
    @prefectures_e = Prefecture.where(:id => 16..18)
    @prefectures_f = Prefecture.where(:id => 25..30)
    @prefectures_g = Prefecture.where(:id => 31..35)
    @prefectures_h = Prefecture.where(:id => 36..39)
    @prefectures_i = Prefecture.where(:id => 40..47)
  end

  def show
    @users = User.where(prefecture_id: params[:id])
    @prefecture = Prefecture.find(params[:id]) 
  end
end
