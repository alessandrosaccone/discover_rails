class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation
  has_one_attached :audio
  has_one_attached :image
  validates_presence_of :conversation_id, :user_id
  validate :must_have_body_or_audio_or_image

  def deleted_for_both?
    deleted_for_user && deleted_for_recipient
  end
  private
  def must_have_body_or_audio_or_image
    if body.blank? && audio.blank? && !image.attached?
      errors.add(:base, "Message must have content!")
    end
  end


end
