require 'spec_helper'

describe Item do
  describe '#link' do

    it "should return nil if the link is empty" do
      item = Item.new
      item.link.should == nil
    end

    it "should return http://www.flickr.com/irissilvermoon" do
      item = Item.new(:link => 'http://www.flickr.com/irissilvermoon')
      item.link.should == "http://www.flickr.com/irissilvermoon"
    end

    it "should insert http:// on links where missing" do
      item = Item.new(:link => 'www.flickr.com/irissilvermoon')
      item.link.should == "http://www.flickr.com/irissilvermoon"
    end
  end
end
