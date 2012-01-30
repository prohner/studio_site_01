require 'spec_helper'

describe "Studio" do
  it "should require name & password" do
    studio = Studio.new
    studio.valid?.should be_false
    
    studio.name = "whatever"
    studio.password = "password"
    studio.valid?.should be_true
  end
  
  describe "authentication" do
    before(:each) do
      @attr = { :name => "name", :password => "123456adf" }
      @studio = Studio.create!(@attr)
    end

    it "should have an encrypted password attribute" do
      @studio.should respond_to(:encrypted_password)
    end
    
    it "should set the encrypted password" do
      @studio.encrypted_password.should_not be_blank
    end
    
    describe "has_password? method" do
      it "should be true if the passwords match" do
        @studio.has_password?(@attr[:password]).should be_true
      end
      
      it "should be false if the passwords don't match" do
        @studio.has_password?(@attr[:password] + "x").should be_false
      end
    end
    
    describe "authenticate method" do
      it "should return nil on bad login" do
        wrong_password_studio = Studio.authenticate(@attr[:name], "whatever123")
        wrong_password_studio.should be_nil
      end
      
      it "should return nil for an email address with no user" do
        nonexistent_name = Studio.authenticate("bademail@abc.com", @attr[:password])
        nonexistent_name.should be_nil
      end
      
      it "should return the studio with good credentials" do
        studio = Studio.authenticate(@attr[:name], @attr[:password])
        studio.should == @studio
      end
      
    end
  end  
end