class NotificationsController < ApplicationController
  def index
    @notifications = policy_scope(Notification).where(user_id: current_user.id)
  end

  def show
    @notification = Notification.find(params[:id])
    authorize @notification
    @offer = Offer.new
  end
end
