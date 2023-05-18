class MessageDeletionChannel < ApplicationCable::Channel
  def subscribed
     stream_from "message_deletion_#{params[:room_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
