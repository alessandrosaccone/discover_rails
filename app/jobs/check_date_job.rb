require 'date'
require 'application_job'

class CheckDateJob < ApplicationJob
  #sidekiq_options queue: 'default', priority: 10
  def perform
    puts "I'm performing the CheckDateJob"
    bookings = Booking.all
    bookings.each do |booking|
=begin    
    puts Date.today.strftime("%e %b %Y") 
    puts DateTime.now.strftime("%H:%M")
    puts booking.post.data.strftime("%e %b %Y")
    puts booking.post.ora.strftime("%H:%M")
    puts (Date.today + 1.day).strftime("%e %b %Y")
    puts (Date.today + 1.day).strftime("%e %b %Y") == booking.post.data.strftime("%e %b %Y")      
   if (Date.today.strftime("%e %b %Y") == booking.post.data.strftime("%e %b %Y") &&
        DateTime.now.strftime("%H:%M") > booking.post.ora.strftime("%H:%M") && booking.expired==false)
=end 
      if (((Date.today + 1.day).strftime("%e %b %Y") == booking.post.data.strftime("%e %b %Y")) && booking.expired==false && booking.post.last_minute==false)
        booking.update(expired: true)
        begin
          puts "I'm sending the exceeded email"
          UserMailer.date_exceeded_email(booking.user).deliver_now
          puts "email sent"
          #puts mail.inspect
        rescue => e
          puts "Failed to send email: #{e.message}"
        end
      end
    end
  end

  def self.schedule_job
    puts "I'm executing the schedule_job"
    Sidekiq::Cron::Job.create(
      name: 'check_date_job',
      cron: '* * * * *',
      class: 'CheckDateJob'
    )
  end
end
