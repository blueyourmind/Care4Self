class NotificationsController < ApplicationController
  before_action :authenticate_user!
  before_action :send_notification_if_needed

  def index
    @notifications = Notification.where(recipient: current_user)

 end
 # Inside a controller action
def create
  # Logic to create a new record
  @record = Record.create(record_params)

  # Create and deliver a notification
  notification = Notification.new(category: 'take medication').with(params: { message: 'Test message' })
  notification.deliver(User.find_by(email: 'test@example.com'))

  # Other logic for the create action
end

end
