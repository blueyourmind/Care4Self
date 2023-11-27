# app/notifications/test_notification.rb

class TestNotification < Noticed::Base
  deliver_by :action_cable, stream: Turbo::StreamsChannel.signed_stream_name([])
  deliver_by :database, stream: Turbo::StreamsChannel.signed_stream_name([])
  # Define your parameters
  param :post


  def to_action_cable
    {  puts "Preparing Action Cable notification"
      channel: "NotificationsChannel",
      data: {
        message: options[:post],
        # Other data you want to send
      }
    }
  end

  def deliver(user_id, medication_name)
    user = params[:user]
    scheduled_time = user.scheduled_medication_time&.is_a?(Numeric) ? Time.zone.at(user.scheduled_medication_time) : nil

    # Check if it's time to deliver the notification
    if scheduled_time.present? && scheduled_time - 2.minutes <= Time.current
      super(user: user)  # Pass the user parameter to the super call
    end
  end

  def initialize(user_id, medication_name)
    @user_id = user_id
    @medication_name = medication_name
  end

  def to_database
    {
      user_id: params[:user_id],
      medication_name: params[:medication_name],
      # other notification data
    }
  end





  def message
    "It's time to take your #{params[:med_type]} of #{params[:post]}"
  end

  def url
    post_path(params[:post])
  end
end
