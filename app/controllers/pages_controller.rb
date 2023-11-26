
class PagesController < ApplicationController
  def notifications
    if user_signed_in?
      @notifications = current_user.notification
    else
      # Handle the case where the user is not signed in
      # For example, you might want to redirect them to the login page
      redirect_to new_user_session_path, alert: 'Please sign in to view notifications.'
    end
  end
end
