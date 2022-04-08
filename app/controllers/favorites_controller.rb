class FavoritesController < ApplicationController
  # before_action :move_to_root_path, only: [:create :destroy]

  def create
    @motivation_favorite = Favorite.new(user_id: current_user.id, motivation_id: params[:motivation_id])  #motivationのネストなので_idが入っている
    @motivation_favorite.save
    redirect_to motivation_path(params[:motivation_id])
  end

  def destroy
    @motivation_favorite = Favorite.find_by(user_id: current_user.id, motivation_id: params[:motivation_id])
    @motivation_favorite.destroy
    redirect_to motivation_path(params[:motivation_id]) 
  end

  # private

  # def move_to_root_path
  #   unless user_signed_in?
  #     redirect_to root_path #サインインしていない場合、indexアクションに戻る
  #   end
  # end
end
