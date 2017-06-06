class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update]
  before_action :set_bike_name, only: [:show, :new]
  before_action :set_bike, only: [:new, :create, :show, :edit]

  def show

  end

  def new
    @schedule = Schedule.new

  end

  def create
    @new_schedule = @bike.build_schedule(schedule_params)
    if @new_schedule.save
      flash[:notice] = "Schedule successfully created"
      redirect_to bike_schedule_path(@bike, @bike.schedule)
    else
      flash[:alert] = "Schedule could not be created"
      redirect_to new_bike_schedule_path
    end
  end

  def edit

  end

  def update
    if @schedule.update(schedule_params)
      flash[:notice] = "Maintenance schedule successfully updated"
      redirect_to bike_schedule_path
    else
      flash[:alert] = "Maintenance schedule update failed"
      redirect_to bike_schedule_path
    end
  end

  private

    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    def set_bike
      @bike = Bike.find(params[:bike_id])
    end

    def set_bike_name
      @bike_name = Bike.find(params[:bike_id]).name
    end

    def schedule_params
      params.require(:schedule).permit(:oil, :sparkplugs, :airfilter, :oilfilter, :coolingfluid, :chain, :break_front, :break_back, :breakfluid, :tyres)
    end
end
