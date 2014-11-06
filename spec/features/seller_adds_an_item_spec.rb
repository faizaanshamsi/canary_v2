# require 'rails_helper'
#
# feature 'seller adds item' do
#   scenario 'seller adds a single item with multiple images' do
#     item = FactoryGirl.build(:item)
#     seller = item.user
#     sign_in_as(seller)
#
#     visit new_item_path
# # comment for test issue 23
#     fill_in "Title", with: item.title
#     fill_in "Description", with: item.description
#     fill_in "Dimensions", with: item.dimensions
#     fill_in "Brand", with: item.brand
#     select "Excellent", from: item.condition
#     fill_in "Age in years", with: item.age
#
#     select  "Dining Room", from: "Room"
#     select  "Dining Table", from: "Category"
#     click_on "Continue"
#
#     expect(page).to have_content("Item successfully created")
#     expect(page).to have_content("#{item_attrs[:title]}")
#     expect(page).to have_content("Add photos")
#
#     attach_file "Add photo", Rails.root.join('spec/fixtures/table.jpeg')
#     click_on "Add another photo"
#     attach_file "Add photo", Rails.root.join('spec/fixtures/table_2.jpeg')
#
#     expect(page).to have_content("Upload successful") 
#   end
#
# end
