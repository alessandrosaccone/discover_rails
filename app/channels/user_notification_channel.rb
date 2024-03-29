class UserNotificationChannel < ApplicationCable::Channel
  def subscribed
     stream_from "user_notification:channel_#{current_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

end
