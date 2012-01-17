
Given /^that I ([^"]*) signed in$/ do |f|
  @user = Factory(:user, :email => 'new@newemail.com')
  if f == "am"
  	visit signin_path
  	sign_in(@user)
  else
  	visit signout_path
  end
end

When /^I log in as the correct user$/ do
  sign_in(@user)
end

def sign_in(user)
	fill_in 'Email',	:with => 'new@newemail.com'
  fill_in 'Password',:with => user.password
  click_button 'Sign in'
end

