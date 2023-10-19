
class MessageNotification < Noticed::Base
  # Add your delivery methods

  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  deliver_by :action_cable, channel: UserNotificationChannel, stream: :notification_stream, format: :action_cable_data
  def notification_stream 
    if(params[:message].user_id == params[:message].conversation.sender_id)
      "channel_#{params[:message].conversation.recipient_id}"
    else
      "channel_#{params[:message].conversation.sender_id}"
    end   
  end

  def action_cable_data 
    { notification_url: url, user: User.find(params[:message].user_id).name, content: params[:message].body }
  end

  # Add required params
  
  param :message

  # Define helper methods to make rendering easier.

  def message
    t(".message")
  end
  #
  def url
    conversation_path(other_email: User.find(params[:message].user_id).email)
  end
end
