require 'spec_helper'

describe User do
  describe '#generate_username' do
    it "should return letters before @ as username" do
      user = User.new
      user.generate_username("irismail@gmail.com")
      user.username.should == "irismail"
    end

    it "adds username when one is not provided" do
      user = User.new(:email => "iris@gmail.com")
      user.save
      user.username.should == "iris"
    end
  end
end