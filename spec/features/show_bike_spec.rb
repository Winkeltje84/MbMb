require 'rails_helper'

describe "Viewing an individual bike" do
  before { login_as user }

  let(:user) { create :user }
  let(:bike) { create :bike, user: user }

  it "will show all details of the bike" do
    visit bike_url(bike)

    expect(page).to have_text(bike.name)
    expect(page).to have_text(bike.brand)
    expect(page).to have_text(bike.model)
    expect(page).to have_text(bike.build)
    expect(page).to have_text(bike.odometer)
  end
end
