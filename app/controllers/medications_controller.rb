class MedicationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @medications = current_user.medications
  end

  def show
    @medication = Medication.find(params[:id])
  end

  def new
    @medication = Medication.new
  end

  def create
    @medication = current_user.medications.build(medication_params)
    if @medication.save
      redirect_to @medication
    else
      render 'new'
    end
  end

  def edit
    @medication = Medication.find(params[:id])
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

  private

  def medication_params
    params.require(:medication).permit(:name, :instruction, :duration, :quantity, :type, :interval_id, :start_date, :end_date, :user_id)
  end
end
