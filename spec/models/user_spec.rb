require 'spec_helper'

describe User do
	
	it "should create new user given valid credentials" do
		Factory.create(:user)
	end
	
	
    describe "authenticate method" do
		
		before(:each) do
			@attr = Factory.attributes_for(:user)
			@user = User.create!(@attr)
		end
		
      it "should return nil on email/password mismatch" do
        wrong_password_user = User.authenticate(@attr[:email], "wrongpass")
        wrong_password_user.should be_nil
      end

      it "should return nil for an email address with no user" do
        nonexistent_user = User.authenticate("bar@foo.com", @attr[:password])
        nonexistent_user.should be_nil
      end

      it "should return the user on email/password match" do
        matching_user = User.authenticate(@attr[:email], @attr[:password])
        matching_user.should == @user
      end
    end
end
# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  admin           :boolean
#  email           :string(255)
#  hashed_password :string(255)
#  salt            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

