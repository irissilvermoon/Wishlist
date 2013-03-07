require 'spec_helper'

feature 'Signing in' do
  before do
    Factory(:user, :email => "wishlist@example.com")
  end

  scenario 'Signing in via confirmation' do
    open_email "wishlist@example.com", :with_subject => /Confirmation/
    p User.first.confirmation_token
    p current_email.body
    click_first_link_in_email
    page.should have_content("Your account was successfully confirmed")
    page.should have_content("Signed in as wishlist@example.com")
  end

  scenario 'Signing in via form' do
    User.find_by_email('wishlist@example.com').confirm!
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', :with => 'wishlist@example.com'
    fill_in 'Password', :with => 'password'
    click_button 'Sign in'
    page.should have_content("Signed in successfully.")
  end
end