Given /^I ([^"]*) have an application$/ do |yes|
  if yes == "do"
    user.create_application(:zip_code => 27777, :phone_number => "919-999-9999")
  else
    user.application.nil?
  end
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

Then /^the user should have an application$/ do
  user.application.should_not be_nil
end

Then /^I should see their application$/ do
  page.should have_content("Foo Bar")
  page.should have_content("Address")
  page.should have_content("Zip")
end

