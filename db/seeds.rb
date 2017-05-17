Maintenance.destroy_all
Bike.destroy_all
User.destroy_all

basTest = User.create!(email: "bas@test.com", password: "abc123")

bike1 = Bike.create!(name: "Mr Orange", brand: "Suzuki", model: "DL650", build: 2010, odometer: 71000, user: basTest)
bike2 = Bike.create!(name: "WantToHave", brand: "Honda", model: "CRF1000L", build: 2017, odometer: 0, user: basTest)

today = Date.today

maintenance1 = Maintenance.create!(odometer: 0, date: 2.years.ago, costs: Faker::Number.decimal(2), oil: Faker::Boolean.boolean, sparkplugs: Faker::Boolean.boolean, airfilter: Faker::Boolean.boolean, oilfilter: Faker::Boolean.boolean, coolingfluid: Faker::Boolean.boolean, chain: Faker::Boolean.boolean, break_front: Faker::Boolean.boolean, break_back: Faker::Boolean.boolean, breakfluid: Faker::Boolean.boolean, tyres: Faker::Boolean.boolean, bike: bike1)
maintenance2 = Maintenance.create!(odometer: 10000, date: 1.years.ago, costs: Faker::Number.decimal(2), oil: Faker::Boolean.boolean, sparkplugs: Faker::Boolean.boolean, airfilter: Faker::Boolean.boolean, oilfilter: Faker::Boolean.boolean, coolingfluid: Faker::Boolean.boolean, chain: Faker::Boolean.boolean, break_front: Faker::Boolean.boolean, break_back: Faker::Boolean.boolean, breakfluid: Faker::Boolean.boolean, tyres: Faker::Boolean.boolean, bike: bike1)
