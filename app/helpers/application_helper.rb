# app/helpers/application_helper.rb

module ApplicationHelper
  def noticed_notifications(notice)
    # Check if notice is not nil before calling methods
    if notice
      notice.all
    else
      []
    end
  end
end
