class Notification < ApplicationRecord
  belongs_to :user
  # belongs_to :recipient, class_name: "User", foreign_key: "recipient_id", optional: true

  scope :unread, -> { where(read_at: nil) }
  validates :message, presence: true
end
