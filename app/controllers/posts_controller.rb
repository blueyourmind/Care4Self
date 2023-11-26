# app/controllers/posts_controller.rb
class PostsController < ApplicationController
  def create
    # ... (your existing code)

     # Schedule the notification delivery at the specified start_time
     start_time = params[:post][:start_time]
     scheduled_at = Time.zone.parse(start_time)  # Adjust to your datetime parsing logic

     notification = TestNotification.with(post: @post, scheduled_at: scheduled_at)
     notification_instance = notification.new(params)
     notification_instance.schedule(notification_instance.scheduled_at).deliver_later(User.all)

     redirect_to @post, notice: 'Post was successfully created.'
   end


  # ... (other actions and methods)
end
