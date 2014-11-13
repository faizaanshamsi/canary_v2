require 'rails_helper'

feature 'User views all items for sale' do
  scenario 'User views default list by best match' do
    item_one = FactoryGirl.create(:item, :published)
    item_two = FactoryGirl.create(:item, :published)
    item_three = FactoryGirl.create(:item, title: "Unapproved Chair")
    FactoryGirl.create(:asking_price, item: item_one)

    visit items_path

    expect(page).to have_content(item_one.title)
    expect(page).to have_content(item_two.title)

    expect(page).to have_content(item_one.location.city)
    expect(page).to have_content(item_two.location.city)

    expect(page).to have_content(item_one.current_price.amount)
    expect(page).to have_content(item_two.current_price.amount)
    #Listing prices display for items whose prices have changed
    expect(page).to have_content(item_one.listing_price.amount)
    expect(page).to_not have_content(item_three.title)
    # TODO: Add test for filepicker thumbnail
  end

  scenario 'User can sort by price' do
    price_one = FactoryGirl.create(:asking_price)
    price_two = FactoryGirl.create(:asking_price, amount: 1)

    clic
    
    expect(price_two.item.title).to appear_before(price_one.item.title)
  end

  scenario 'User can sort by date listed' do

  end
end
