class Public::SnsFavoritesController < ApplicationController
  before_action :set_post

  def create
    @favorite = SnsFavorite.new(user_id: current_user.id,  post_id: @post.id)
    @favorite.save
    @post.create_notification_favorite!(current_user)
  end

  def destroy
    @favorite = SnsFavorite.find_by(user_id: current_user.id, post_id: @post.id)
    @favorite.destroy
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

end
