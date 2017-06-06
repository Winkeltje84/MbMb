class Schedule < ApplicationRecord
  belongs_to :bike

  validates :oil, presence: true
  validates :sparkplugs, presence: true
  validates :airfilter, presence: true
  validates :oilfilter, presence: true
  validates :coolingfluid, presence: true
  validates :chain, presence: true
  validates :break_front, presence: true
  validates :break_back, presence: true
  validates :breakfluid, presence: true
  validates :tyres, presence: true
end
