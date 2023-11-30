class MedicationsController < ApplicationController
  before_action :set_medication, only: [:show, :edit, :update, :destroy, :congrats]

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
    @medication = Medication.new(medication_params)
    @medication.user = current_user
    calculate_medication_duration

    case @medication.frequency
    when "Once per day"
      @medication_quantity = @medication_duration * 1
    when "Twice per day"
      @medication_quantity = @medication_duration * 2
    when "Thrice per day"
      @medication_quantity = @medication_duration * 3
    end

    if @medication_duration == 1
      @medication.duration = "1 day"
    else
      @medication.duration = "#{@medication_duration} days"
    end

    @medication.save
      redirect_to medications_path, notice: "Medication successfully created!"

  end



  def edit
    # @medication is already set by before_action
  end

  def update
    @medication.update(medication_params)
    redirect_to medications_path, notice: "Medication successfully updated!"
  end

  def destroy
    @medication = Medication.find(params[:id])
    @medication.destroy
    redirect_to medications_path, notice: "Medication successfully deleted!"
  end


  # def congrats
  #   Rails.logger.debug("Entering congrats action")
  #   # @medication is already set by before_action
  # end


  private

  def set_medication
    @medication = current_user.medications.find(params[:id])
  end

  def medication_params
    params.require(:medication).permit(:name, :med_type, :quantity, :instruction, :frequency, :start_time, :interval_id, :start_date, :end_date)
  end

  def calculate_medication_duration
    @medication_duration = (@medication.end_date - @medication.start_date).to_i / 1.day.to_i
  end


  def schedule_medication_notification(medication)
    notification_message = "It's time to take your #{medication.quantity} #{medication.medication_type} of #{medication.name}"


    TestWorker.perform_at(medication.start_time, current_user.id, medication.name, notification_message)
  end
end
