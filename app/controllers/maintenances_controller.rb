class MaintenancesController < ApplicationController
  before_action :set_maintenance, only: [:edit, :update]
  before_action :authenticate_user!

  def index
    @bike_maintenances = Maintenance.find_bike_maintenances(params[:bike_id].to_i)
  end

  private

    def set_maintenance
      @maintenance = Maintenance.find(params[:id])
    end
end
