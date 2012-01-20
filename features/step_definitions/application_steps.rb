Given /^I don't have an application$/ do
  @user.application.nil?
end

When /^Fill out the application form$/ do
  click_link "Create an Application"
  fill_in "Address",		:with => "123 Main St"
  fill_in "State",			:with => "NC"
  fill_in "City",				:with => "Anywhere"
  fill_in "application_zip_code",	  		:with => "27777"
  fill_in "application_phone_number",:with => "919-593-6333"
  click_button "Submit Application"
end

Then /^I should have an application$/ do
  user = User.first
  user.application.should_not be_nil
end

