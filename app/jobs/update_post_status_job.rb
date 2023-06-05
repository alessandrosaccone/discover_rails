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