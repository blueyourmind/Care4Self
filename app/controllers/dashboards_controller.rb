class DashboardsController < ApplicationController
  def index
    @medications = Medication.all
  end
end
