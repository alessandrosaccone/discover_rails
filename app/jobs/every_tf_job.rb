require 'date'
require 'application_job'

class EveryTfJob < ApplicationJob
  #sidekiq_options queue: 'default', priority: 10
  def perform
    puts "I'm performing the every 24 job"
    bookings=Booking.where(transfertoguide: false)
    bookings.each do |booking|
      post=booking.post
      if post.data<Date.today 
        value=((booking.amount-0.1*booking.amount)*100).to_i
        puts "Booking Amount: #{value}"
        transfer = Stripe::Transfer.create(
          {
            amount: value, 
            currency: 'eur', # The currency of the transfer
            destination: post.user.stripe_account_id, # The Stripe Account ID of the guide
            description: 'Payment for tourism service', # Description for the transfer
          }
        )
        booking.transfertoguide=true
        booking.save!  
      end
    end
  end

  def self.schedule_job
    puts "I'm executing the 24 four hour job"
    Sidekiq::Cron::Job.create(
      name: 'every_tf_job',
      cron: '0 0 * * *',
      class: 'EveryTfJob'
    )
  end
end
