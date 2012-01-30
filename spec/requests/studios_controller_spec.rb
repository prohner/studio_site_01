require 'spec_helper'

describe StudiosController do  
  describe "Get 'new'" do
    it "should be successful" do
      get 'studios/new'
      response.should be_success
    end
  end
end