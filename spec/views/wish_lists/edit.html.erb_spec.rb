require 'spec_helper'

describe "wish_lists/edit" do
  before(:each) do
    @wish_list = assign(:wish_list, stub_model(WishList,
      :title => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit wish_list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => wish_lists_path(@wish_list), :method => "post" do
      assert_select "input#wish_list_title", :name => "wish_list[title]"
      assert_select "input#wish_list_description", :name => "wish_list[description]"
    end
  end
end
