class NotificationController < ApplicationController
  def notification_handler 
    notification = Notification.find(params[:notification])
    notification.update(read_at: DateTime.now)

    if notification.type == 'CommentNotification'
      redirect_to post_path(notification.params[:comment].post)
    elsif notification.type == 'MessageNotification'
      redirect_to conversation_path(other_email: User.find(notification.params[:message][:user_id]).email)
    end
  end

  private

  def post_params
    params.require(:notification).permit(:notification)
  end

end

