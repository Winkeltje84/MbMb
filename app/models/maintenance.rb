class Maintenance < ApplicationRecord
  belongs_to :bike

  validates :odometer, presence: true, length: { maximum: 6 }
  validates :date, presence: true, format: { with: /(19|20)\d{2}/i }
  # validates :oil, presence: true, inclusion: { in: [true, false] }
  # validates :sparkplugs, presence: true, inclusion: { in: [true, false] }
  # validates :airfilter, presence: true
  # validates :oilfilter, presence: true
  # validates :coolingfluid, presence: true
  # validates :chain, presence: true
  # validates :break_front, presence: true
  # validates :break_back, presence: true
  # validates :breakfluid, presence: true
  # validates :tyres, presence: true
end
