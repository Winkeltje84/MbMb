class Bike < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { maximum: 15 }
  validates :brand, presence: true, length: { maximum: 10 }
  validates :model, presence: true, length: { maximum: 15 }
  validates :build, presence: true,
            format: { with: /(19|20)\d{2}/i },
            numericality: {
              greater_than_or_equal_to: 1900,
              less_than_or_equal_to: Date.today.year
            }
  validates :odometer, presence: true, lenght: { is: 6 }  
end


create_table "bikes", force: :cascade do |t|
  t.string   "name"
  t.string   "brand"
  t.string   "model"
  t.integer  "build"
  t.integer  "odometer"
  t.integer  "user_id"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
  t.index ["user_id"], name: "index_bikes_on_user_id", using: :btree
end
