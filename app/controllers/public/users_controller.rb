class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:requester_show, :sns_show, :search]
  before_action :set_user, only: [:show, :requester_show, :sns_show, :edit, :requester_edit, :sns_edit, :update, :requester_update, :sns_update, :favorites, :sns_favorites]
  before_action :ensure_currect_user, only: [:show, :edit, :requester_edit, :sns_edit, :update, :sns_update, :requester_update, :unsubscribe, :withdraw]

  def show
    favorites = Favorite.where(user_id: @user.id).pluck(:request_id)
    favorite_requests = Request.find(favorites)
    @favorite_requests = Kaminari.paginate_array(favorite_requests).page(params[:page]).per(8)
  end

  def requester_show
    @requests = @user.requests.page(params[:page]).per(8)
  end

  def sns_show
    favorites = SnsFavorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
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

  def sns_update
    if @user.update(sns_params)
      flash[:notice] = "ユーザ情報を変更しました。"
      redirect_to sns_home_user_path
    else
      render :sns_edit
    end
  end

  def requester_update
    if @user.update(requester_params)
      flash[:notice] = "ユーザ情報を変更しました。"
      if @user.status == 'requester'
        @user.create_notification_user!(current_user)
      end
      redirect_to requester_home_user_path
    else
      render :requester_edit
    end
  end

  def unsubscribe
  end

  def withdraw
  end

  def search
  end

  def favorites
    favorites = Favorite.where(user_id: @user.id).pluck(:request_id)
    favorite_requests = Request.find(favorites)
    @favorite_requests = Kaminari.paginate_array(favorite_requests).page(params[:page]).per(9)
  end

  def sns_favorites
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def ensure_currect_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to posts_path
    end
  end


  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :phone, :nickname, :profile, :sns_image)
  end

  def requester_params
    params.require(:user).permit(:introduction, :status, :requester_image)
  end

  def sns_params
    params.require(:user).permit(:nickname, :profile, :sns_image)
  end
end
