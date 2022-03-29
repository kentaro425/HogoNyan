class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "更新が完了しました。"
      redirect_to admin_user_path(@user.id)
    else
      flash[:alert] = "空欄は無効です。"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :nickname, :information, :profile, :postal_code, :address, :phone, :email, :status, :is_active, :is_deleted, :requester_image, :sns_image)
  end
end
