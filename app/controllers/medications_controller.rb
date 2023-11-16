class MedicationsController < ApplicationController
  before_action :set_medication, only: [:show, :edit, :update, :destroy, :set_duration, :congrats]
  def index
    @medications = current_user.medications
  end
  def show
    # @medication is already set by before_action
  end
  def new
    @medication = Medication.new
  end
  def create
    @medication = Medication.new(medication_params)
    @medication.user = current_user
    if @medication.save
      redirect_to set_duration_medication_path(@medication)
    else
      render :new
    end
  end
  def edit
    # @medication is already set by before_action
  end
  def update
    if @medication.update(medication_params)
      redirect_to @medication
    else
      render 'edit'
    end
  end
  def destroy
    @medication.destroy
    redirect_to medications_path
  end
  def set_duration
    redirect_to congrats_medication_path(@medication)
  end
  def congrats
    # @medication is already set by before_action
  end
  private
  def set_medication
    @medication = current_user.medications.find(params[:id])
  end
  def medication_params
    params.require(:medication).permit(
      :name, :instruction, :quantity, :med_type,
      :start_date, :end_date, :interval_id,
      medication_frequencies_attributes: [:id, :frequency_id, :start_time],
      interval_attributes: [:id, :name, :value]
    )
  end
end
