class MedicationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @medications = current_user.medications
  end

  def show
    @medication = current_user.medications.find(params[:id])
  end

  def new
    @medication = Medication.new
    @medication.medication_frequencies.build
    @medication.build_interval

  end

  def create
    @medication = Medication.new(medication_params)
    # @medication.medication_frequencies.build
    # @medication.build_interval
    @medication.user = current_user

    if @medication.save
      # if params[:medication][:redirect_to_set_duration] == "true"
        redirect_to set_duration_medication_path(@medication)
      # else
      #   redirect_to @medication, notice: 'Medication was successfully created.'
      # end
    else
      Rails.logger.debug @medication.errors.inspect
      render :new
    end
  end


  def edit
    @medication = current_user.medications.find(params[:id])
  end

  def update
    @medication = Medication.find(params[:id])
    if @medication.update(medication_params)
      redirect_to @medication
    else
      render 'edit'
    end
  end

  def destroy
    @medication = Medication.find(params[:id])
    @medication.destroy
    redirect_to medications_path
  end

  def set_duration
    @medication = Medication.find(params[:id])
    redirect_to congrats_medication_path(@medication)
  end

  def congrats
    @medication = Medication.find(params[:id])
  end

  private

  def medication_params
    params.require(:medication).permit(:name, :instruction, :quantity, :med_type,
      :start_date, :end_date, :interval_id, medication_frequencies_attributes: [:id, :frequency_id, :start_time],
      interval_attributes: [:id, :name, :value])
  end




end
