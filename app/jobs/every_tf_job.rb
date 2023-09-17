require 'date'
require 'application_job'

class EveryTfJob < ApplicationJob
  #sidekiq_options queue: 'default', priority: 10
  def perform
    puts "I'm performing the every 24 job"
    
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
