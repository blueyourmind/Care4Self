class IntervalsController < ApplicationController
  before_action :authenticate_user!

  def index
    @intervals = Interval.all
  end

  def show
    @interval = Interval.find(params[:id])
  end

  def new
    @interval = Interval.new
  end

  def create
    @interval = Interval.new(interval_params)
    if @interval.save
      redirect_to @interval
    else
      render 'new'
    end
  end

  def edit
    @interval = Interval.find(params[:id])
  end

  def update
    @interval = Interval.find(params[:id])
    if @interval.update(interval_params)
      redirect_to @interval
    else
      render 'edit'
    end
  end

  def destroy
    @interval = Interval.find(params[:id])
    @interval.destroy
    redirect_to intervals_path
  end

  private

  def interval_params
    params.require(:interval).permit(:name)
  end
end
