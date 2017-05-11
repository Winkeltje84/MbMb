FactoryGirl.define do
  factory :bikes do
    name    { Faker::Lorem.sentence(2) }
    brand   { Faker::Lorem.sentence(1) }
    model   { Faker::Lorem.sentence(1) }
    build   { Faker::Number.between(1900, 2017)}
    odometer{ Faker::Number.between(0, 999999)}
    user    { build(:user) }
  end
end
