class MaintenancesController < ApplicationController
  before_action :set_maintenance, only: [:edit, :update]
  before_action :set_bike, only: [:index, :new, :create]
  before_action :authenticate_user!

  def index
    @bike_maintenances = Maintenance.find_bike_maintenances(params[:bike_id].to_i)
  end

  def new
    @maintenance = Maintenance.new
    # debugger
  end

  def create
    # debugger
    @new_maintenance = @bike.maintenances.build(maintenance_params)
    if @new_maintenance.save
      redirect_to bike_maintenances_path, notice: "Maintenance successfully added"
    else
      render :new, notice: "Maintenance build failed"
    end
  end

  private

    def set_maintenance
      @maintenance = Maintenance.find(params[:id])
    end

    def set_bike
      @bike = Bike.find(params[:bike_id])
    end

    def maintenance_params
      params.require(:maintenance).permit(:date, :odometer, :costs, :oil, :sparkplugs, :airfilter, :oilfilter, :coolingfluid, :chain, :break_front, :break_back, :breakfluid, :tyres)
    end
end
