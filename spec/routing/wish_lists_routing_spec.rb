require "spec_helper"

describe WishListsController do
  describe "routing" do

    it "routes to #index" do
      get("/wish_lists").should route_to("wish_lists#index")
    end

    it "routes to #new" do
      get("/wish_lists/new").should route_to("wish_lists#new")
    end

    it "routes to #show" do
      get("/wish_lists/1").should route_to("wish_lists#show", :id => "1")
    end

    it "routes to #edit" do
      get("/wish_lists/1/edit").should route_to("wish_lists#edit", :id => "1")
    end

    it "routes to #create" do
      post("/wish_lists").should route_to("wish_lists#create")
    end

    it "routes to #update" do
      put("/wish_lists/1").should route_to("wish_lists#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/wish_lists/1").should route_to("wish_lists#destroy", :id => "1")
    end

  end
end
