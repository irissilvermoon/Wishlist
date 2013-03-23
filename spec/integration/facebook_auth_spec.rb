require 'spec_helper'

feature 'Facebook Auth' do
  before do
    OmniAuth.config.mock_auth[:facebook] = {
      'uid' => '12345',
      "user_info" => {
        "email" => "foobar@example.com"
      }
    }
  end

  it "signs in with Facebook" do
    visit '/'
    click_link 'Sign in with Facebook'
    page.should have_content("Signed in with Facebook successfully.")
  end
end