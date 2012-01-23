Given /^I ([^"]*) have an application$/ do |yes|
  if yes == "do"
    user.create_application(:zip_code => 27777, :phone_number => "919-999-9999")
  else
    user.application.should be_nil
  end
end

When /^Fill out the ([^"]*) application form$/ do |age|
  if age == "new"
    click_link "Create an Application"
    address = "123 Main St"
  else
    click_link "Edit Application"
    address = "321 Main St"
  end
  fill_in "Address",		:with => address
  fill_in "State",			:with => "NC"
  fill_in "City",				:with => "Anywhere"
  fill_in "application_zip_code",	  		:with => "27777"
  fill_in "application_phone_number",:with => "919-593-6333"
  click_button "Submit Application"
end

Then /^I should see the updated information$/ do
  page.should have_content("321 Main St")
end


Then /^the user should have an application$/ do
  user.application.should_not be_nil
end

Then /^I should see their application$/ do
  page.should have_content("Foo Bar")
  page.should have_content("Address")
  page.should have_content("Zip")
end

