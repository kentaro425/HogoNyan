class Admin::NotificationsController < ApplicationController
  def index
    @notifications = Notification.page(params[:page]).per(20).where(action: ['user_status', 'complete'])
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy
    redirect_to request.referer
  end

  def destroy_all
    @notifications = Notification.page(params[:page]).per(20).where(action: ['user_status', 'complete'])
    @notifications.destroy_all
    redirect_to request.referer
  end
end
