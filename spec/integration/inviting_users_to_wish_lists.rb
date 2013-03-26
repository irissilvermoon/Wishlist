require 'spec_helper'

feature "Inviting users to Wishlists" do
  let!(:user) { Factory(:confirmed_user) }

  before do
    sign_in_as!(user)
    visit '/'
    click_link 'Invite User'
  end