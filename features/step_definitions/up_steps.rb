Given /^I am an admin$/ do
  @user.admin = true
end

Then /^I should see the user list$/ do
  Then "I should see Example"
end

