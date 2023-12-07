class Notification < ApplicationRecord
  self.inheritance_column = nil
  belongs_to :recipient, class_name: "User", foreign_key: "recipient_id"
  # belongs_to :recipient, class_name: "User", foreign_key: "recipient_id", optional: true
    # validates :user_id, presence: true
  scope :unread, -> { where(read_at: nil) }
  validates :message, presence: true
  validates :recipient_id, presence: true
end
def show_notifications
  @notifications = Notification.where(user_id: current_user.id)
  render json: @notifications
end
