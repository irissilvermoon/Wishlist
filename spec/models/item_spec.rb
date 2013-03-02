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

  describe '#cost=' do
    it "should return cost even if $ sign is in place" do
      item = Item.new(:cost => '$300')
      item.cost.should == 300
    end

    it "should return cost if $ sign is not in place" do
      item = Item.new(:cost => '300')
      item.cost.should == 300
    end

    it "should return decimels on cost" do
      item = Item.new(:cost => '300.01')
      item.cost.should == 300.01
    end
  end
end
