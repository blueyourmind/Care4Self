class MedicationsController < ApplicationController
  before_action :set_medication, only: [:show, :edit, :update, :destroy, :congrats]
  def index
    @user = current_user

    case params[:filter]
    when 'today'
      @medications = @user.medications.where(start_date: Date.today)
    when 'tomorrow'
      @medications = @user.medications.where(start_date: Date.tomorrow)
    else
      @medications = @user.medications
    end
  end

  def show

    # @medication is already set by before_action
  end

  def new
    @medication = Medication.new
    @medication.medication_frequencies.new
    # @medication.interval = Interval.new(name: 'Weekly')
  end

  def create
    @medication = Medication.new(medication_params)
    @medication.user = current_user
    @medication_duration = ((@medication.end_date - @medication.start_date).to_i) / 86400

    case @medication.frequency
    when "Once per day"
      @medication_quantity = @medication_duration * 1
    when "Twice per day"
      @medication_quantity = @medication_duration * 2
    when "Thrice per day"
      @medication_quantity = @medication_duration * 3
    end

    if @medication_duration === 1
      @medication_duration = "1 day"
    else
      @medication.duration = @medication_duration.to_s + " days"
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



  # def set_duration
  #   redirect_to congrats_medication_path(@medication)
  # end

  def congrats
    # @medication is already set by before_action
  end

  private
  def set_medication
    @medication = current_user.medications.find(params[:id])
  end

  def medication_params
    params.require(:medication).permit(
      :name, :instruction, :quantity, :med_type, :frequency,
      :start_date, :end_date, :interval_id, :start_time,
      interval_attributes: [:id, :name, :value]
    )
  end
end
