require 'spec_helper'

describe "wish_lists/show" do
  before(:each) do
    @wish_list = assign(:wish_list, stub_model(WishList,
      :title => "Title",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Description/)
  end
end
