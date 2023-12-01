class MedicationsController < ApplicationController
  before_action :set_medication, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    @notifications = @user.notifications.unread
    @notifications.update_all(read_at: Time.zone.now)

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
    # @medication is already set by before_action
  end

  def new
    @notifications = Notification.unread
    @medication = Medication.new
    @medication.medication_frequencies.new
  end

  def create
    @medication = current_user.medications.build(medication_params)

    if @medication.save
      create_medication_notification("Medication successfully created: #{@medication.name}", current_user.id)
      redirect_to medications_path, notice: 'Medication successfully created!'
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

  def create_medication_notification(message, recipient_id)
    notification = current_user.notifications.build(message: message, recipient_id: recipient_id)

    if notification.save
      NotificationBroadcastJob.perform_later('notifications_channel', "Time to take your #{@medication.name}")
    else
      flash[:alert] = "Notification couldn't be saved: #{notification.errors.full_messages.join(', ')}"
      Rails.logger.error(flash[:alert])
    end
  end

  def set_medication
    @medication = current_user.medications.find(params[:id])
  end

  def medication_params
    params.require(:medication).permit(:name, :med_type, :quantity, :instruction, :frequency, :start_time, :interval_id, :start_date, :end_date)
  end
end
