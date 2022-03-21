class Public::NotificationsController < ApplicationController
  def index
    notifications = current_user.passive_notifications.page(params[:page]).per(20)
    @notifications = notifications.where(checked: false)
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.update(checked: true)
    redirect_to request.referer
  end

  def destroy_all
    @notifications = current_user.passive_notifications.page(params[:page]).per(20)
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
    redirect_to request.referer
  end
end
