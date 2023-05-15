class CheckDateJob < ApplicationJob
  def perform
    bookings = Booking.all
    bookings.each do |booking|
      if (Date.today > booking.created_at)
      UserMailer.date_exceeded_email(booking.user_id).deliver_now
    end
  end
end
