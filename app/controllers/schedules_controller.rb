class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show]
  before_action :set_bike_name, only: [:show, :new]

  def show
    # debugger
  end

  private

    def set_schedule
      # debugger
      @schedule = Schedule.find(params[:id])
    end

    def set_bike_name
      @bike_name = Bike.find(params[:bike_id]).name
    end
end
