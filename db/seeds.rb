Bike.destroy_all
User.destroy_all

basTest = User.create!(email: "bas@test.com", password: "abc123")

bike1 = Bike.create!(name: "Mr Orange", brand: "Suzuki", model: "DL650", build: 2010, odometer: 71000, user: basTest)
bike2 = Bike.create!(name: "WantToHave", brand: "Honda", model: "CRF1000L", build: 2017, odometer: 0, user: basTest)
