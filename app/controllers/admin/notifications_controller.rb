class Admin::NotificationsController < ApplicationController
  def index
    @notifications = Notification.page(params[:page]).per(20).where(action: 'user_status')
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.update(checked: true)
    redirect_to request.referer
  end

  def destroy_all
    @notifications.update(checked: true)
    redirect_to request.referer
  end
end
