require 'rails_helper'

feature "User edits profile" do

  scenario "User edits profile" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    visit '/users/edit'

    fill_in 'Email', with: user.email + "t"
    fill_in 'Username', with: (user.username + "t")
    fill_in 'Full name', with: (user.full_name + "t")
    fill_in 'Phone number', with: '9999999999'
    fill_in 'Current password', with: user.password

    click_button 'Update'

    page.should have_content("Your account has been updated successfully")
  end

end
