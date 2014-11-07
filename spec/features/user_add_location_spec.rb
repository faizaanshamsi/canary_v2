require 'rails_helper'

feature 'user adds location' do
  scenario 'user adds first location' do
    location = FactoryGirl.build(:location)
    sign_in_as(location.user)

    visit new_location_path
    expect(find_field("Name").value).to eql("Home")
    expect(find_field("Zip").value).to eql(location.user.zip)
    fill_in "Name", with: location.name
    fill_in "Address", with: location.address
    fill_in "City", with: location.city
    select location.state, from: "State"
    fill_in "Zip", with: location.zip
    click_on "Submit"

    expect(page).to have_content("Location added successfully")
    expect(page).to have_content("My locations")
    expect(page).to have_content(location.name)
  end

  scenario 'user adds second location' do
    old_location = FactoryGirl.create(:location, default: true)
    location = FactoryGirl.build(:location, user: old_location.user)
    sign_in_as(location.user)

    visit new_location_path
    expect(find_field("Name").value).to eql("Home")
    fill_in "Name", with: location.name
    fill_in "Address", with: location.address
    fill_in "City", with: location.city
    select location.state, from: "State"
    fill_in "Zip", with: location.zip
    check "Make default"
    click_on "Submit"

    expect(page).to have_content("Location added successfully")
    expect(page).to have_content("My locations")
    expect(page).to have_content(location.name)
  end
end
