class Maintenance < ApplicationRecord
  belongs_to :bike

  validates :odometer, presence: true, length: { maximum: 6 }
  validates :date, presence: true , format: { with: /(19|20)\d{2}/i }
  validates :oil, inclusion: [true, false]
  validates :sparkplugs, inclusion: [true, false]
  validates :airfilter, inclusion: [true, false]
  validates :oilfilter, inclusion: [true, false]
  validates :coolingfluid, inclusion: [true, false]
  validates :chain, inclusion: [true, false]
  validates :break_front, inclusion: [true, false]
  validates :break_back, inclusion: [true, false]
  validates :breakfluid, inclusion: [true, false]
  validates :tyres, inclusion: [true, false]

  def self.find_bike_maintenances(bike_id)
    bike_maintenances = Maintenance.select{ |maintenance| maintenance.bike_id == bike_id }
    sort_by_date(bike_maintenances)
    # bike_maintenances.sort_by_date
    return bike_maintenances
  end

  def self.sort_by_date(bike_maintenances)
    bike_maintenances.sort! { |a,b| a.date <=> b.date } 
    return bike_maintenances
  end


end
