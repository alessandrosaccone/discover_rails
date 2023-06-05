require 'application_job'
class UpdatePostStatusJob < ApplicationJob
    include Sidekiq::Worker

    def perform
        Post.where(status: "open").find_each do |post|
            if post.expired?
                post.update(status: "expired")
            end
        end
    end
end