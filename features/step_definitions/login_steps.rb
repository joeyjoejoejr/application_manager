When /^I fill out the new user form with ([^"]*) information$/ do |valid|
  fill_in "First name", :with => "Joe"
  fill_in "Last name", :with => "Jackson"
  if valid == "valid"
  		fill_in "Email", :with => "joe@example.com"
  else if valid == "invalid"
	  fill_in "Email", :with => "" if valid == "invalid"
   	else
   		puts ("Must be either valid or invalid")
   		false
   	end
   end
  fill_in "Password", :with => "foobar"
  fill_in "Confirmation", :with => "foobar"
  click_button "Sign up"
end

When /^I dump.* the response$/ do
  puts user.email
  puts user.password
  puts User.all.to_s
  puts body
end
