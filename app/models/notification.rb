class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :recipient
  scope :unread, -> { where(read_at: nil) }

  def self.create_notification
    user = User.find(1)
    recipient = Recipient.find(1)

    notification = new(
      user: user,
      recipient: recipient,
      message: "It's time to take your medication"
    )

    if notification.save
      puts "Notification saved successfully!"
    else
      puts "Error saving notification: #{notification.errors.full_messages.join(', ')}"
    end
  end
end
