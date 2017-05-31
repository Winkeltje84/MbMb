class Bike < ApplicationRecord
  belongs_to :user
  has_many :maintenances, dependent: :destroy
  has_one :schedule

  validates :name, presence: true, length: { maximum: 15 }
  validates :brand, presence: true, length: { maximum: 10 }
  validates :model, presence: true, length: { maximum: 15 }
  validates :build, presence: true,
            format: { with: /(19|20)\d{2}/i },
            numericality: {
              greater_than_or_equal_to: 1900,
              less_than_or_equal_to: Date.today.year
            }
  validates :odometer, presence: true, length: { maximum: 6 }
end
