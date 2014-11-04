require 'rails_helper'

feature 'seller adds item' do
  scenario 'seller adds a single item with multiple images' do
    seller = FactoryGirl.create(:user)
    item_attrs = { title: 'Excellent oak table',
                   description: 'This excellent oak table is the best table.',
                   dimensions: '10 x 10',
                   brand: 'Amish',
                   condition: 'excellent',
                   age: 20 } 

   sign_in_as(seller)

   visit new_item_path

    fill_in "Title", with: item_attrs[:title]
    fill_in "Description", with: item_attrs[:description]
    fill_in "Dimensions", with: item_attrs[:dimensions]
    fill_in "Brand", with: item_attrs[:brand]
    select "Excellent", from: "Condition"
    fill_in "Age in years", with: item_attrs[:age]

    select  "Dining table", from: "Category"
    click_on "Continue"

    expect(page).to have_content("Item successfully created")
    expect(page).to have_content("#{item_attrs[:title]}")
    expect(page).to have_content("Add photos")

    attach_file "Add photo", Rails.root.join('spec/fixtures/table.jpeg')
    click_on "Add another photo"
    attach_file "Add photo", Rails.root.join('spec/fixtures/table_2.jpeg')
    
    expect(page).to have_content("Upload successful") 
  end
  
end
