class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user, optional: true
  validates :content, presence: true

  after_create_commit :notify_recipient 

  def notify_recipient

    CommentNotification.with(comment: self).deliver(self.post.user)
    
  end
  
end
