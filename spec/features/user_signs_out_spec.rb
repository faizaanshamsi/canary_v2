require 'rails_helper'

feature "User signs out" do
  scenario "User signs out" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    click_on 'Sign Out'
    expect(page).to have_content("Signed out successfully")
  end
end
