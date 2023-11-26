class Reminder < ApplicationRecord
  belongs_to :medication_frequency
  belongs_to :user

  validates :description, presence: true
  validates :pre_alarm_time, presence: true
  validates :alarm_time, presence: true
  validates :alarm_duration, presence: true
  validates :has_taken, inclusion: { in: [true, false] }

  # def send_notification_if_needed
  #   # Check if the current time is close to the start_time
  #   if (start_time - Time.now) <= 5.minutes
  #     # Trigger the notification logic
  #     notification = Notification.new(category: 'medication_reminder').with(params: {})
  #     notification.deliver(user)  # Adjust based on your user association

  #     # Add JavaScript to display an alert
  #     js_code = <<~JS
  #       alert("It's time to take your medication!");
  #     JS

  #     # Add the JavaScript code to the response
  #     ActionController::Base.new.render(inline: js_code)
  #   end
  # end
end
