class MedicationsController < ApplicationController
  before_action :set_medication, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    @notifications = @user.notifications.unread
    @notifications.update_all(read_at: Time.zone.now)
    @medication = Medication.all
    if @user
      case params[:filter]
      when 'today'
        @medications = @user.medications.where('start_date >= ?', Date.today)
      when 'tomorrow'
        @medications = @user.medications.where('start_date >= ?', Date.tomorrow)
      else
        @medications = @user.medications
      end
    else
      redirect_to root_path, alert: 'You need to be logged in to access this page.'
    end
  end

  def show
    @medications = Medication.where(user_id: current_user.id)
  end

  def new
    @notifications = Notification.unread
    @medication = Medication.new
    @medication.medication_frequencies.new
    @medications = Medication.where(user_id: current_user.id)
  end

  def create
    @medication = current_user.medications.build(medication_params)


    if @medication.save!
      message = "It's Time to take your #{@medication.quantity} #{@medication.med_type} of #{@medication.name} #{@medication.instruction}, Have a good day !!"
      create_medication_notification(message)
      schedule_medication_notification(@medication, message)

      flash[:notice] = 'Medication successfully created'
      redirect_to medications_path 
      NotificationBroadcastJob.schedule_medication_notification(@medication)
    else
      render :new
    end
  end




  def edit
    # @medication is already set by before_action
  end

  def update
    @medication.update(medication_params)
    redirect_to medications_path, notice: 'Medication successfully updated!'
  end

  def destroy
    @medication.destroy
    redirect_to medications_path, notice: 'Medication successfully deleted!'
  end

  private

  def create_medication_notification(message)
    notification = Notification.new(message: message)
    notification.recipient = current_user


    # notification = current_user.notifications.build(message: message)

    if notification.save
      NotificationBroadcastJob.perform_later("notification_channel_#{current_user.id}", current_user.id, message)
    else
      handle_notification_creation_error(notification)
    end
  end




  def handle_notification_creation_error(notification)
    flash[:alert] = "Notification couldn't be saved: #{notification.errors.full_messages.join(', ')}"
    Rails.logger.error(flash[:alert])
  end


  def schedule_medication_notification(medication, message)
    notification_time = medication.start_time
    NotificationBroadcastJob.set(wait_until: notification_time).perform_later("notification_channel_#{current_user.id}", current_user.id, message)
  end





  def set_medication
    @medication = current_user.medications.find(params[:id])
  end

  def medication_params
    params.require(:medication).permit(
      :name,
      :med_type,
      :quantity,
      :instruction,
      :frequency,
      :start_time,
      :interval_id,
      :start_date,
      :end_date
    )
  end
end
