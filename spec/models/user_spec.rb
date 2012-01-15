require 'spec_helper'

describe User do
	
	it "should create new user given valid credentials" do
		Factory.create(:user)
	end
	
end
