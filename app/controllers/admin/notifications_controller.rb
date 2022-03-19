class Admin::NotificationsController < ApplicationController
  def index
    @notifications = current_user.passive_notifications.page(params[:page]).per(20)
    @notifications.where(notification_allowed: true).each do |notification|
      notification.update_attributes(checked: true)
    end
  end

  def destroy
  end

  def destroy_all
  end
end
