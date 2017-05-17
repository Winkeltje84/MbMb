FactoryGirl.define do
  factory :maintenance do
    odometer 1
    date "2017-05-16"
    costs Faker::Number.decimal(2)
    oil Faker::Boolean.boolean
    sparkplugs Faker::Boolean.boolean
    airfilter Faker::Boolean.boolean
    oilfilter Faker::Boolean.boolean
    coolingfluid Faker::Boolean.boolean
    chain Faker::Boolean.boolean
    break_front Faker::Boolean.boolean
    break_back Faker::Boolean.boolean
    breakfluid Faker::Boolean.boolean
    tyres Faker::Boolean.boolean
    bike { build(:bike) }
  end
end
