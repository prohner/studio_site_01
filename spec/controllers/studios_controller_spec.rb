require 'spec_helper'

describe StudiosController do  
  render_views
  
  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end
  end
  
  describe "POST 'create'" do
    describe "failure" do
      before(:each) do
        @attr = { :name => "" }
      end
      
      it "should not create a user" do
        lambda do
          post :create, :studio => @attr
        end.should_not change(Studio, :count)
      end
    end
  end
  
end