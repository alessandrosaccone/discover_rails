require 'sidekiq-scheduler'
require_relative '../../lib/schedule_setup' 

Sidekiq.configure_server do |config|
  config.on(:startup) do
    Sidekiq.schedule = YAML.load_file(File.expand_path('../../../config/schedule.yml', __FILE__))
    SidekiqScheduler::Scheduler.reload_schedule!
    puts "I'm calling schedule_job"
    #CheckDateJob.schedule_job
  end

 
end
