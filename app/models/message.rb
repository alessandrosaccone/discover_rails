class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation
  has_one_attached :audio
  validates_presence_of :conversation_id, :user_id
  validate :body_or_audio

  private
  def body_or_audio
    if body.blank? && audio.blank?
      errors.add(:base, "Message must have content!")
    end
  end
end
