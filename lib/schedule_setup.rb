require 'sidekiq-scheduler'
require_relative '../app/jobs/check_date_job'
require 'sidekiq-cron'

CheckDateJob.schedule_job