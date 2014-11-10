require 'rails_helper'

feature 'seller submits a listing' do
  scenario 'seller submits a listing with photos' do
    item = FactoryGirl.build(:item)
    seller = item.user
    alternate_location = FactoryGirl.create(:location, user: seller, default: true)
    asking_price = FactoryGirl.create(:asking_price, item: item)
    sign_in_as(seller)

    visit new_item_path
    expect(find_field('Location').text).to eql(item.location.name)
    select alternate_location.name, from: 'Location'
    fill_in "Title", with: item.title
    fill_in "Asking price", with: asking_price.amount
    fill_in "Description", with: item.description
    fill_in "Dimensions", with: item.dimensions
    select "Excellent", from: "Condition"
    fill_in "Purchase price", with: item.purchase_price
    fill_in "Brand", with: item.brand
    fill_in "Age", with: item.age
    fill_in "Quantity", with: 1
    select item.category.name, from: 'item[category_id]'
    click_on "Add Photos"

    # upload muliple photos
    # publish item
    # expect listing to exist, expect photos and content to be presen
  end

  scenario 'seller without location tries to submit a listing' do
    seller = FactoryGirl.create(:user)
    sign_in_as(seller)
    visit new_item_path
    expect(page).to have_content("Please add a location to continue")
    expect(page).to_not have_content("Add Item")
  end

  scenario 'seller tries to submit a listing without photos' do

  end
end
