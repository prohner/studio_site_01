require 'spec_helper'

describe Country, "basic fields" do
  it "should require name" do
    country = Country.new
    country.valid?.should be_false
    
    country.name = "whatever"
    country.valid?.should be_true
  end
end