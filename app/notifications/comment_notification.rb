# To deliver this notification:
#
#CommentNotification.with(post: @post).deliver_later(current_user)
#CommentNotification.with(booking: @booking).deliver(@booking.post.user.id)

class CommentNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :action_cable, debug: true
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  param :comment

  # Define helper methods to make rendering easier.
  #
  def message
    t(".message")
  end
  #
  def url
    booking_path(params[:comment])
  end

end
