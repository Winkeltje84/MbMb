FactoryGirl.define do
  factory :bike do
    name    "name"
    brand   "brand name"
    model   "mobel name"
    build   2011
    odometer  99000
    user    { build(:user) }
  end
end
