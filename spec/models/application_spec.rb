require 'spec_helper'

describe Application do

	before(:each) do
		@attr = { :address => "123 Main St", :city => "Anywhere", :state => "NC",
							:zip_code=> "27777", :phone_number => "919-593-6333" }
		@user = Factory(:user)
	end	
	
	it "should create a new application given valid attributes" do
		@user.create_application(@attr)
	end
	
	it "should not create a new application without valbaid credentials" do
		bad_application = @user.create_application(:zipcode => 23)
		bad_application.should be_invalid
	end
end
# == Schema Information
#
# Table name: applications
#
#  id           :integer         not null, primary key
#  user_id      :integer
#  address      :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  city         :string(255)
#  state        :string(255)
#  zip_code     :integer
#  phone_number :string(255)
#  answer1      :text
#  answer2      :text
#  answer3      :text
#

