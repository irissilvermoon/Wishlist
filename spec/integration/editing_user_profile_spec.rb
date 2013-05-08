require 'spec_helper'

feature 'User Profiles' do
  let!(:user) { Factory(:confirmed_user) }

  before do
    sign_in_as!(user)
    visit '/'
    click_link 'Profile'
    page.should have_content("#{user.username}")
    click_button 'Edit Profile'
  end

  scenario 'Users can edit their profiles' do
    fill_in "Address 1", :with => "123 something st"
    click_button "Submit"
    page.should have_content("Profile has been sucessfully updated.")
  end
end