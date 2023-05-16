# config/schedule.rb

require 'sidekiq/scheduler'

def load_sidekiq_schedule
    schedule_file = File.expand_path('./schedule.yml', __FILE__)
    schedule = YAML.load_file(schedule_file)
    puts schedule
    Sidekiq.schedule = schedule
  end
  
  Sidekiq::Scheduler.configure do |config|
    load_sidekiq_schedule
  end
  
