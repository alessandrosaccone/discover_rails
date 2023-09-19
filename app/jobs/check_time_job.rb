require 'date'
require 'application_job'

class CheckTimeJob < ApplicationJob
  #sidekiq_options queue: 'default', priority: 10
  def perform
    puts "I'm performing the CheckTimeJob"
    posts = Post.all
    posts.each do |post|
    post_minutes=post.ora.strftime("%H:%M").split(':').map(&:to_i).inject(0) { |acc, val| acc * 60 + val }
    now_minutes=Time.now.strftime("%H:%M").split(':').map(&:to_i).inject(0) { |acc, val| acc * 60 + val }
    #puts (post_minutes - now_minutes)
    #puts post.data == Date.today && (post_minutes-now_minutes) <= 60
    if post.data == Date.today && (post_minutes-now_minutes) <= 60 #&& post.num_pers == 0
        post.update(last_minute: true)
        begin
          puts "Provvedo a cambiare i dati"
          @n = 3
          post.update(persone_rimanenti: @n)
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
