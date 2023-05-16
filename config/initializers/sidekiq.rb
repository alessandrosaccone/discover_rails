Sidekiq.configure_server do |config|
    config.redis = { url: 'redis://localhost:6379/0' } # Set your Redis connection details
  end
  
  Sidekiq.configure_client do |config|
    config.redis = { url: 'redis://localhost:6379/0' } # Set your Redis connection details


  Sidekiq.schedule = {
    check_date_job: {
      cron: "0 53 9,15,18,21 * * *",
      class: "CheckDateJob",
      queue: "default"
    }
  }
  end
  