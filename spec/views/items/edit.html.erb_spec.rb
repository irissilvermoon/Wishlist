require 'spec_helper'

describe "items/edit" do
  before(:each) do
    @item = assign(:item, stub_model(Item,
      :title => "MyString",
      :description => "MyString",
      :link => "MyString",
      :cost => "9.99",
      :image => "MyText"
    ))
  end

  it "renders the edit item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => wish_list_item_path(@wish_list, @item), :method => "post" do
      assert_select "input#item_title", :name => "item[title]"
      assert_select "input#item_description", :name => "item[description]"
      assert_select "input#item_link", :name => "item[link]"
      assert_select "input#item_cost", :name => "item[cost]"
      assert_select "textarea#item_image", :name => "item[image]"
    end
  end
end
