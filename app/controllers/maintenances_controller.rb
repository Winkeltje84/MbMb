class MaintenancesController < ApplicationController
  before_action :set_maintenance, only: [:edit, :update, :destroy]
  before_action :set_bike, only: [:index, :new, :create, :edit]
  before_action :authenticate_user!

  def index
    @bike_maintenances = Maintenance.find_bike_maintenances(params[:bike_id].to_i)
    @km_ago = Maintenance.calculate_km(@bike_maintenances, @bike.odometer)
    @bike_maintenances = Maintenance.sort_by_date_from_old_to_current(@bike_maintenances)
  end

  def new
    @maintenance = Maintenance.new
  end

  def create
    @new_maintenance = @bike.maintenances.build(maintenance_params)
    if @new_maintenance.save
      flash[:notice] = "Maintenance successfully added"
      redirect_to bike_maintenances_path
    else
      flash[:alert] = "Maintenance build failed"
      redirect_to new_bike_maintenance_path
    end
  end

  def edit

  end

  def update
    if @maintenance.update(maintenance_params)
      flash[:notice] = "Maintenance successfully updated"
      redirect_to bike_maintenances_path
    else
      flash[:alert] = "Maintenance update failed"
      redirect_to edit_bike_maintenance_path
    end
  end

  def destroy
    if @maintenance.destroy
      flash[:notice] = "Maintenance successfully deleted"
      redirect_to bike_maintenances_path
    else
      flash[:alert] = "Unsuccessful in deleting maintenance"
      redirect_to bike_maintenances_path
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
