require 'date'
require 'application_job'

#This job update the status of a post as last_minute one hour before it's start (if it isn't already last_minute
#and only if the post.num==0)

class CheckTimeJob < ApplicationJob
  #sidekiq_options queue: 'default', priority: 10
  def perform
    puts "I'm performing the CheckTimeJob"
    posts = Post.all
    posts.each do |post|
    post_minutes=post.ora.strftime("%H:%M").split(':').map(&:to_i).inject(0) { |acc, val| acc * 60 + val }
    now_minutes=Time.now.strftime("%H:%M").split(':').map(&:to_i).inject(0) { |acc, val| acc * 60 + val }
    if (post.data == Date.today && (post_minutes-now_minutes) <= 60) && post.last_minute==false && post.num_pers == 0
        post.update(last_minute: true)
        begin
          puts "Provvedo a cambiare i dati"
          post.update(persone_rimanenti: post.persone_lastminute)
          puts "update del numero fatto"
        rescue => e
          puts "Failed to change data: #{e.message}"
        end
      end
    end
  end

  def self.schedule_job
    puts "I'm executing the time_job"
    Sidekiq::Cron::Job.create(
      name: 'check_time_job',
      cron: '* * * * *',
      class: 'CheckTimeJob'
    )
  end
end
