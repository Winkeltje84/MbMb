require 'rails_helper'

describe "Current user viewing the list of his/her bikes" do
  before { login_as user }

  let(:user) { create :user, email: "current@user.com" }
  let(:another_user) { create :user, email: "another@user.com" }

  let!(:bike1) { create :bike, name: "user bike 1", user: user }
  let!(:bike2) { create :bike, name: "user bike 2", user: user }
  let!(:bike3) { create :bike, name: "other bike", user: another_user}

  it "shows all his/her bikes" do
    visit bikes_url
    expect(page).to have_text("user bike 1")
    expect(page).to have_text("user bike 2")
    # expect(page).to have_text("other bike") - FAILS
  end

  it "does not show other users his/her bike" do
    visit bikes_url
    # expect(page).not_to have_text("user bike 1") - FAILS
    expect(page).not_to have_text("other bike")
  end

end
