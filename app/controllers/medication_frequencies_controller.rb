class MedicationFrequenciesController < ApplicationController
  before_action :authenticate_user!

  def index
    @medication_frequencies = MedicationFrequency.all
  end

  def show
    @medication_frequency = MedicationFrequency.find(params[:id])
  end

  def new
    @medication_frequency = MedicationFrequency.new
  end

  def create
    @medication_frequency = MedicationFrequency.new(medication_frequency_params)
    if @medication_frequency.save
      redirect_to @medication_frequency
    else
      render 'new'
    end
  end

  def edit
    @medication_frequency = MedicationFrequency.find(params[:id])
  end

  def update
    @medication_frequency = MedicationFrequency.find(params[:id])
    if @medication_frequency.update(medication_frequency_params)
      redirect_to @medication_frequency
    else
      render 'edit'
    end
  end

  def destroy
    @medication_frequency = MedicationFrequency.find(params[:id])
    @medication_frequency.destroy
    redirect_to medication_frequencies_path
  end

  private

  def medication_frequency_params
    params.require(:medication_frequency).permit(:medication_id, :frequency_id)
  end
end
