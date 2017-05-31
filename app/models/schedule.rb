class Schedule < ApplicationRecord
  belongs_to :bike

  validates :oil
  validates :sparkplugs
  validates :airfilter
  validates :oilfilter
  validates :coolingfluid
  validates :chain
  validates :break_front
  validates :break_back
  validates :breakfluid
  validates :tyres
end
