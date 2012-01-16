Given /^the following (.+) records$/ do |factory, table|
	table.hashes.each do |hash|
		Factory.create(factory, hash)
	end
end

Given /^I am logged in as "([^"]*)" with password "([^"]*)"$/ do |email, password|
  pending # express the regexp above with the code you wish you had
end

When /^I visit the root path$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I fill out the new user form with ([^"]*) information$/ do |valid|
  @user = Factory.build(:user)
  fill_in "First name", :with => @user.first_name
  fill_in "Last name", :with => @user.last_name
  if valid == "valid"
  		fill_in "Email", :with => @user.email
  else if valid == "invalid"
	  fill_in "Email", :with => "" if valid == "invalid"
   	else
   		puts ("Must be either valid or invalid")
   		false
   	end
   end
  fill_in "Password", :with => @user.password
  fill_in "Confirmation", :with => @user.password_confirmation
  click_button "Sign up"
end

When /^I dump.* the response$/ do
  puts User.all
end