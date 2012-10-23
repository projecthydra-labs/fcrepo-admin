require 'spec_helper'

describe CollectionsController do

  describe "#index" do
    before do
      @collection1 = Collection.create(:pid => "collection:1")
      @collection2 = Collection.create(:pid => "collection:2")
    end
    after do
      @collection1.delete
      @collection2.delete
    end
    it "should display a list of all the collections" do
      get :index
      response.should be_successful
      assigns[:collections].should include(@collection1)
      assigns[:collections].should include(@collection2)
    end
  end
  
  describe "#new" do
    it "should set a template collection" do
      get :new
      response.should be_successful
      assigns[:collection].should be_kind_of Collection
    end
  end
  
  describe "#create" do
    before do
      @count = Collection.count
      @pid = "collection:1"
      @empty_string_pid = ""
      @do_not_use_pid = "__DO_NOT_USE__"
    end
    after do
      Collection.find_each { |c| c.delete }
    end
    it "should create a collection with the provided PID" do
      post :create, :collection=>{:pid=>@pid}
      response.should redirect_to collections_path
      Collection.count.should eq(@count + 1)
    end
    it "should create a collection with a system-assigned PID when given no PID" do
      post :create, :collection=>{}
      response.should redirect_to collections_path
      Collection.count.should eq(@count + 1)
    end
    it "should create a collection with a system-assigned PID when given an empty string as a PID" do
      post :create, :collection=>{:pid=>@empty_string_pid}
      response.should redirect_to collections_path
      Collection.count.should eq(@count + 1)
    end
    it "should create a collection with a system-assigned PID when given a do not use PID" do
      post :create, :collection=>{:pid=>@do_not_use_pid}
      response.should redirect_to collections_path
      Collection.count.should eq(@count + 1)
    end
  end
end
