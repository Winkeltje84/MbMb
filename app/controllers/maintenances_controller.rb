class MaintenancesController < ApplicationController
  before_action :set_maintenance, only: [:edit, :update]

  before_action :authenticate_user!

  def index
    debugger
    # @maintenances = Maintenance.select{|maintenance| maintenance.id == params[:bike_id].to_i}
    @bike_maintenances = Maintenance.find_bike_maintenances(params[:bike_id].to_i)

    debugger

  end

  private

    def set_maintenance
      @maintenance = Maintenance.find(params[:id])
    end




end



# CONTROLLER
# def show
#     @current_negotiation_bids = ProductNegotiation.get_bids_from_current_negotiation(@single_bids, params).sort_by &:created_at
#
#   end
#
#
#
#   MODEL
#
#   def self.get_bids_from_current_negotiation(all_bids, params)
#
#       select_bids = all_bids.select do |bid|
#         bid.product_negotiation_id == params[:id].to_i
#       end
#
#       return select_bids
#     end
