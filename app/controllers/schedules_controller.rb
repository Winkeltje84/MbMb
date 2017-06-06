class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update]
  before_action :set_bike_name, only: [:show, :new]
  before_action :set_bike, only: [:new, :create, :show, :edit]

  def show
    debugger
  end

  def new
    @schedule = Schedule.new
    # debugger
  end

  def create
    # debugger
    @new_schedule = @bike.build_schedule(schedule_params)
    if @new_schedule.save
      debugger
      flash[:notice] = "Schedule successfully created"
      redirect_to bike_schedule_path(@bike, @bike.schedule)
    else
      flash[:alert] = "Schedule could not be created"
      render :new
    end
  end

  def edit
    debugger
  end

  def update
    # debugger
    if @schedule.update(schedule_params)
      flash[:notice] = "Maintenance schedule successfully updated"
      redirect_to bike_schedule_path
    else
      flash[:alert] = "Maintenance schedule update failed"
      render :update
    end
  end

  private

    def set_schedule
      # debugger
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
