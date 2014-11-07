require 'rails_helper'

feature 'user adds location' do
  scenario 'user adds first location' do
    location = FactoryGirl.build(:location)
    sign_in_as(location.user)

    visit new_location_path
    save_and_open_page
    click_on "Add location"
    #expect name to be prefilled as home
    fill_in "Name", with: location.name
    fill_in "Address", with: location.address
    fill_in "City", with: location.city
    select location.state, from: "State"
    fill_in "Zip", with: location.zip

    expect(page).to have_content("Location added successfully")
    expect(page).to have_content("My locations")
    expect(page).to have_content(location.name)
    expect(location.user.default_location).to eql(location)
  end

  scenario 'user adds second location' do
    old_location = FactoryGirl.create(:location, default: true)
    location = FactoryGirl.build(:location, user: old_location.user)
    sign_in_as(location.user)

    visit edit_user_registration_path

    click_on "Add location"
    #expect name to be prefilled as home
    fill_in "Name", with: location.name
    fill_in "Address", with: location.address
    fill_in "City", with: location.city
    select location.state, from: "State"
    fill_in "Zip", with: location.zip
    check "Make default"

    expect(page).to have_content("Location added successfully")
    expect(page).to have_content("My locations")
    expect(page).to have_content(location.name)
    expect(location.user.default_location).to eql(location)
  end
end
