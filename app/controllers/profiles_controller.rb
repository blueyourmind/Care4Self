class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:new]

  def new
    head :no_content
  end

  def show
    @user = current_user

  end
  def send_medication_reminders
  end
end
