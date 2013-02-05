require 'spec_helper'

feature "Viewing Wish lists" do
  before do
    1.upto(4) do |i| 
      Factory(:wish_list, :title => "Wish list #{i}", :description => "Wish list #{i} description")
    end
  end

  scenario "Viewing wish lists index" do
    visit "/wish_lists"
    1.upto(4) do |i|
      page.should have_content("Wish list #{i}")
    end
  end
end