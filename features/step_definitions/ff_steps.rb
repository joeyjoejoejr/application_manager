
Given /^that I am not signed in$/ do
  user = Factory(:user, :email => 'new@newemail.com')
  visit signout_path
end

When /^I log in as the correct user$/ do
  user = User.first
  puts User.count
  fill_in 'Email',	:with => 'new@newemail.com'
  fill_in 'Password',:with => user.password
  click_button 'Sign in'
  
end

