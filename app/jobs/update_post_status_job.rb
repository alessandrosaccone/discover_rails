=begin
require 'application_job'
class UpdatePostStatusJob < ApplicationJob
    def perform
        Post.where(status: "open").find_each do |post|
            if post.expired?
                post.update(status: "expired")
            end
        end
    end
end
=end

require 'date'
require 'application_job'

class UpdatePostStatusJob < ApplicationJob
  #sidekiq_options queue: 'default', priority: 10
  def perform
    puts "I'm performing the update post status job"
    
  end

  def self.schedule_job
    puts "I'm executing the update post status job"
    Sidekiq::Cron::Job.create(
      name: 'update_post_status_job',
      cron: '* * * * *',
      class: 'UpdatePostStatusJob'
    )
  end
end