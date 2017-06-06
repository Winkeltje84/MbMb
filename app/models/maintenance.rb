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
    return bike_maintenances
  end

  def self.sort_by_date_from_old_to_current(bike_maintenances)
    bike_maintenances.sort! { |a,b| a.date <=> b.date }
    return bike_maintenances
  end

  def self.calculate_km(bike_maintenances, current_odometer)
    sort_by_date_from_current_to_old(bike_maintenances)
    kilometers = set_km_to_no_maintenance(current_odometer) #kilometers = {} # create new object that will receive all km
    find_last_item_maintenance(bike_maintenances, kilometers, current_odometer)
    return kilometers
  end

  def self.sort_by_date_from_current_to_old(bike_maintenances)
    bike_maintenances.sort! { |a,b| b.date <=> a.date }
  end

  def self.find_last_item_maintenance(bike_maintenances, kilometers, current_odometer)
    bike_maintenances.each do |maintenance|
      if ((kilometers[:oil] === current_odometer) && (maintenance.oil === true))
        kilometers[:oil] = (current_odometer - maintenance.odometer)
      end
      if ((kilometers[:sparkplugs] === current_odometer) && (maintenance.sparkplugs === true))
        kilometers[:sparkplugs] = (current_odometer - maintenance.odometer)
      end
      if ((kilometers[:airfilter] === current_odometer) && (maintenance.airfilter === true))
        kilometers[:airfilter] = (current_odometer - maintenance.odometer)
      end
      if ((kilometers[:oilfilter] === current_odometer) && (maintenance.oilfilter === true))
        kilometers[:oilfilter] = (current_odometer - maintenance.odometer)
      end
      if ((kilometers[:coolingfluid] === current_odometer) && (maintenance.coolingfluid === true))
        kilometers[:coolingfluid] = (current_odometer - maintenance.odometer)
      end
      if ((kilometers[:chain] === current_odometer) && (maintenance.chain === true))
        kilometers[:chain] = (current_odometer - maintenance.odometer)
      end
    if ((kilometers[:break_front] === current_odometer) && (maintenance.break_front === true))
        kilometers[:break_front] = (current_odometer - maintenance.odometer)
      end
      if ((kilometers[:break_back] === current_odometer) && (maintenance.break_back === true))
        kilometers[:break_back] = (current_odometer - maintenance.odometer)
      end
      if ((kilometers[:breakfluid] === current_odometer) && (maintenance.breakfluid === true))
        kilometers[:breakfluid] = (current_odometer - maintenance.odometer)
      end
      if ((kilometers[:tyres] === current_odometer) && (maintenance.tyres === true))
        kilometers[:tyres] = (current_odometer - maintenance.odometer)
      end
    end
  end

  def self.set_km_to_no_maintenance(current_odometer)
    return kilometers = {
      oil: current_odometer,
      sparkplugs: current_odometer,
      airfilter: current_odometer,
      oilfilter: current_odometer,
      coolingfluid: current_odometer,
      chain: current_odometer,
      break_front: current_odometer,
      break_back: current_odometer,
      breakfluid: current_odometer,
      tyres: current_odometer,
    }
  end

end
