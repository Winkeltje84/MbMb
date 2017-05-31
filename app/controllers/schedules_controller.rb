class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show]

  def show
    debugger
  end

  private

    def set_schedule
      debugger
      @schedule = Schedule.find(params[:id])
    end
end
