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

    it "does not create a username that is already present" do
      user1 = Factory.create(:user, :email => "iris@something.com")
      user2 = Factory.create(:user, :email => "iris@iris.com")
      user1.username.should_not == user2.username
    end

    it "creates a unique username if one is already present" do
      user1 = Factory.create(:user, :email => "iris@something.com")
      user2 = Factory.create(:user, :email => "iris@iris.com")
      user2.username.should == "iris-1"
    end

    it "does not iterates through usernames to create a unique name" do
      user1 = Factory.create(:user, :email => "iris@something.com")
      user2 = Factory.create(:user, :email => "iris@iris.com")
      user3 = Factory.create(:user, :email => "iris@thisemail.com")
      user1.username.should == "iris"
      user2.username.should == "iris-1"
      user3.username.should == "iris-2"
    end
  end
end