FactoryGirl.define do
  factory :maintenance do
    odometer 1
    date "2017-05-16 18:05:32"
    costs "9.99"
    oil false
    sparkplugs false
    airfilter false
    oilfilter false
    coolingfluid false
    chain false
    break_front false
    break_back false
    breakfluid false
    tyres false
    bike nil
  end
end
