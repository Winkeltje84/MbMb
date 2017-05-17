class BikesController < ApplicationController
  before_action :set_bike, only: [:show, :edit, :update]
  before_action :authenticate_user!

  def index
    @bikes = current_user.bikes
  end

  def show
  end

  def new
    @bike = current_user.bikes.build
  end

  def create
    @bike = current_user.bikes.build(bike_params)

    if @bike.save
      redirect_to @bike, notice: "You registrated a new bike, congrats!"
    else
      render :new
    end
  end

  def update
    if @bike.update(bike_params)
      redirect_to @bike, notice: "Your motorbike has been updated"
    else
      render :edit
    end
  end


  private

    def set_bike
      @bike = Bike.find(params[:id])
    end

    def bike_params
      params.require(:bike).permit(:name, :brand, :model, :build, :odometer)
    end

end
