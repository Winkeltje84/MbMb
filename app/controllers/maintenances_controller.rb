class MaintenancesController < ApplicationController
  before_action :set_maintenance, only: [:edit, :update]
  before_action :set_bike, only: [:index, :new]
  before_action :authenticate_user!

  def index
    @bike_maintenances = Maintenance.find_bike_maintenances(params[:bike_id].to_i)
  end

  def new
    @maintenance = Maintenance.new
  end

  private

    def set_maintenance
      @maintenance = Maintenance.find(params[:id])
    end

    def set_bike
      @bike = Bike.find(params[:bike_id])
    end
end
