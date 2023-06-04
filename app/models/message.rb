class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation, dependent: :destroy
  has_one_attached :audio, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  validates_presence_of :conversation_id, :user_id
  validate :must_have_body_or_audio_or_image

  private
  def must_have_body_or_audio_or_image
    if body.blank? && audio.blank? && !image.attached?
      errors.add(:base, "Message must have content!")
    end
  end
end
