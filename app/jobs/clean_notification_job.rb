require 'application_job'

class CleanNotificationJob < ApplicationJob
  #sidekiq_options queue: 'default', priority: 10
  def perform
     
  end

  def self.schedule_job
    puts "I'm executing the clean_notification_job"
    Sidekiq::Cron::Job.create(
      name: 'clean_notification_job',
      cron: '* * * * *',
      class: 'CleanNotificationJob'
    )
  end
end
