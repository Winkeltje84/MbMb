class Maintenance < ApplicationRecord
  belongs_to :bike

  validates :odometer, presence: true, length: { maximum: 6 }
  validates :date, presence: true,
            format: { with: /(19|20)\d{2}/i },
            numericality: {
              greater_than_or_equal_to: 1900,
              less_than_or_equal_to: Date.today.year
            }
  validates :costs
  validates :oil, presence: true
  validates :sparkplugs, presence: true
  validates :airfilter, presence: true
  validates :oilfilter, presence: true
  validates :coolingfluid, presence: true
  validates :chain, presence: true
  validates :break_front, presence: true
  validates :break_front, presence: true
  validates :breakfluid, presence: true
  validates :tyres, presence: true
end
