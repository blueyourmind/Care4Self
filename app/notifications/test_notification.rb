# app/notifications/test_notification.rb

class TestNotification < Noticed::Base
  deliver_by :action_cable, stream: Turbo::StreamsChannel.signed_stream_name([])
  deliver_by :database, stream: Turbo::StreamsChannel.signed_stream_name([])
  # Define your parameters
  param :post

  def to_database
    {
      params: params,
    }
  end

  def to_action_cable
    {
      channel: "NotificationsChannel",
      data: {
        message: options[:post],
        # Other data you want to send
      }
    }
  end
  
  def deliver(user)
    # Check if it's time to deliver the notification
    if user.scheduled_medication_time - 2.minutes <= Time.current
      super(user)
    end
  end


  def message
    "It's time to take your #{params[:med_type]} of #{params[:post]}"
  end

  def url
    post_path(params[:post])
  end
end
