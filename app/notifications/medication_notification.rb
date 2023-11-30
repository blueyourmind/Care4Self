class MedicationNotification < Noticed::Base
  deliver_by :action_cable, stream: "notifications_stream"
  deliver_by :database

  param :message
  param :med_type
  param :user_id

  def to(action_cable_params)
    {
      title: "Medication Reminder",
      body: action_cable_params[:message],
      med_type: action_cable_params[:med_type]
    }
  end

  def to_database
    {
      message: params[:message],
      user_id: params[:user_id],
      med_type: params[:med_type]
    }
  end
end
