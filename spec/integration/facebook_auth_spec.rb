require 'spec_helper'

feature 'Facebook Auth' do
  before do
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      :provider => 'facebook',
      :uid => '12345678',
      :info => {
        :email => "foobar@wishlist.com"
      }
    })
  end

  it "signs in with Facebook" do
    visit '/'
    click_link 'Sign in with Facebook'
    page.should have_content("Signed in with Facebook successfully.")
  end
end