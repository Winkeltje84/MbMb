Bike.destroy_all
User.destroy_all

basTest = User.create!(email: "bas@test.com", password: "abc123")

bike1 = Bike.create!(name: "Mr Orange", brand: "Suzuki", model: "DL650", build: 2010, odometer: 71000, user: basTest)
