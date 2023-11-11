class FrequenciesController < ApplicationController
  before_action :authenticate_user!

  def index
    @frequencies = Frequency.all
  end

  def show
    @frequency = Frequency.find(params[:id])
  end

  def new
    @frequency = Frequency.new
  end

  def create
    @frequency = Frequency.new(frequency_params)
    if @frequency.save
      redirect_to @frequency
    else
      render 'new'
    end
  end

  def edit
    @frequency = Frequency.find(params[:id])
  end

  def update
    @frequency = Frequency.find(params[:id])
    if @frequency.update(frequency_params)
      redirect_to @frequency
    else
      render 'edit'
    end
  end

  def destroy
    @frequency = Frequency.find(params[:id])
    @frequency.destroy
    redirect_to frequencies_path
  end

  private

  def frequency_params
    params.require(:frequency).permit(:name)
  end
end
