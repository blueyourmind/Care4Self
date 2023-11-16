class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:new]

  def new
    @user = User.new
  end

  def show
    @user = current_user

  end
end
