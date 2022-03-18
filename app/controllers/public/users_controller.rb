class Public::UsersController < ApplicationController
  before_action :set_user, only: [:show, :requester_show, :sns_show, :edit, :requester_edit, :update, :requester_update, :favorites, :sns_favorites]

  def show
  end

  def requester_show
  end

  def sns_show
  end

  def edit
  end

  def requester_edit
  end

  def sns_edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "ユーザ情報を変更しました。"
      redirect_to home_user_path
    else
      render :edit
    end

  end

  def requester_update
    if @user.update(requester_params)
      flash[:notice] = "ユーザ情報を変更しました。"
      redirect_to requester_home_user_path
    else
      render :edit
    end

  end

  def unsubscribe
  end

  def withdraw
  end

  def search
  end

  def favorites
    favorites= Favorite.where(user_id: @user.id).pluck(:request_id)
    @favorite_requests = Request.find(favorites)
  end

  def sns_favorites
    favorites= SnsFavorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :phone, :nickname, :profile, :sns_image)
  end

  def requester_params
    params.require(:user).permit(:introduction, :status, :requester_image)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
