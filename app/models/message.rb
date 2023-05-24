class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation
  has_one_attached :audio
  validates_presence_of :conversation_id, :user_id
  validate :must_have_body_or_audio

  private
  def must_have_body_or_audio
    if body.blank? && audio.blank?
      errors.add(:base, "Message must have content!")
    end
  end
end
