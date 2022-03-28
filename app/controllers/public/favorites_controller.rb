class Public::FavoritesController < ApplicationController
  before_action :set_request

  def create
    @favorite = Favorite.new(user_id: current_user.id, request_id: @request.id)
    @favorite.save
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, request_id: @request.id)
    @favorite.destroy
  end

  private

  def set_request
    @request = Request.find(params[:request_id])
  end
end
