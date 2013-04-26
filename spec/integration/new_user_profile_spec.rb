require 'spec_helper'

feature 'User Profiles' do
  let!(:user) { Factory(:confirmed_user) }

  before do
    sign_in_as!(user)
    visit '/'
    click_link 'Profile'
  end

  scenario 'User can view their own profile' do
    page.should have_content("#{user.username}")
    page.should have_content("#{user.email}")
  end
end