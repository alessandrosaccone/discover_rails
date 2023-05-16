require 'date'

class CheckDateJob < ApplicationJob
  queue_as :default

  def perform
    bookings = Booking.all
    bookings.each do |booking|
    puts Date.today.strftime("%e %b %Y") 
    puts DateTime.now.strftime("%H:%M")
    puts booking.post.data.strftime("%e %b %Y")
    puts booking.post.ora.strftime("%H:%M")
      if (Date.today.strftime("%e %b %Y") == booking.post.data.strftime("%e %b %Y") &&
        DateTime.now.strftime("%H:%M") > booking.post.ora.strftime("%H:%M"))
        UserMailer.date_exceeded_email(booking.user).deliver_now
      end
    end
  end
end
