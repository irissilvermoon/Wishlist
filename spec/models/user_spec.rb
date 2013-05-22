require 'spec_helper'

describe User do
  describe '#generate_username' do
    it "should return letters before @ as username" do
      user = User.new
      user.generate_username("irismail@gmail.com")
      user.username.should == "irismail"
    end
  end
end