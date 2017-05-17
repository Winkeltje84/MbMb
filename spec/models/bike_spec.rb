require 'rails_helper'

describe "Bike model" do

  describe "validations" do
    it "is invalid without a name" do
      bike = Bike.new(name: "")
      bike.valid?
      expect(bike.errors).to have_key(:name)
      # expect(bike.errors).not_to have_key(:name) FAILS = OK
    end

    it "is invalid with a name with more than 15 characters" do
      bike = Bike.new(name: "this is more than fifteen characters")
      bike.valid?
      expect(bike.errors).to have_key(:name)
      # expect(bike.errors).not_to have_key(:name) - FAILS = OK
    end

    it "is invalid without a brand name" do
      bike = Bike.new(brand: "")
      bike.valid?
      expect(bike.errors).to have_key(:brand)
      # expect(bike.errors).not_to have_key(:brand) - FAILS = OK
    end

    it "is invalid with a brand of more than 10 characters" do
      bike = Bike.new(brand: "a brand with more than 10 charactters")
      bike.valid?
      expect(bike.errors).to have_key(:brand)
      # expect(bike.errors).not_to have_key(:brand) FAILS = OK
    end

    it "is invalid without a model name" do
      bike = Bike.new(model: "")
      bike.valid?
      expect(bike.errors).to have_key(:model)
      # expect(bike.errors).not_to have_key(:model)  FAILS = OK
    end

    it "is invalid with a model name of more than 15 characters" do
      bike = Bike.new(model: "a model with more than 10 charactters")
      bike.valid?
      expect(bike.errors).to have_key(:brand)
       #expect(bike.errors).not_to have_key(:model) #FAILS = OK
    end

    it "is invalid without a production year" do
      bike = Bike.new(build: "")
      bike.valid?
      expect(bike.errors).to have_key(:build)
      #expect(bike.errors).not_to have_key(:build)  FAILS = OK
    end

    it "is invalid with a production year higher than the current date" do
      bike = Bike.new(build: 2019)
      bike.valid?
      expect(bike.errors).to have_key(:build)
      #expect(bike.errors).not_to have_key(:build) #FAILS = OK
    end

    it "is invalid with a production year before 1900" do
      bike = Bike.new(build: 1899)
      bike.valid?
      expect(bike.errors).to have_key(:build)
      #expect(bike.errors).not_to have_key(:build) #FAILS = OK
    end

    it "is invalid without a current odemeter amount" do
      bike = Bike.new(odometer: "")
      bike.valid?
      expect(bike.errors).to have_key(:odometer)
      # expect(bike.errors).not_to have_key(:odometer)# - FAILS = OK
    end

    it "is invalid when the odometer has more than 6 characters (eg. higher than 999999)" do
      bike = Bike.new(odometer: 1000000)
      bike.valid?
      expect(bike.errors).to have_key(:odometer)
      #expect(bike.errors).not_to have_key(:odometer) #FAILS = OK
    end
  end

  describe "- Association with user: " do
    let!(:user) { create :user }
    let!(:other_user) { create :user }
    let!(:bike1) { create :bike, user: user }
    let!(:bike2) { create :bike, user: user }
    let!(:bike3) { create :bike, user: other_user }

    it "has many bikes" do
      expect(user.bikes).to include(bike1)
      expect(user.bikes).to include(bike2)
    end

    it "doesn't have another_user's bike" do
      bike3 = other_user.bikes.new(name: "third bike")

      expect(user.bikes).not_to include(bike3)
      expect(other_user.bikes).to include(bike3)
    end

    it "deletes associated bikes" do
      expect { user.destroy }.to change(Bike, :count).by(-2)
    end
  end
end
