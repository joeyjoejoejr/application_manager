
Given /^that I ([^"]*) signed in$/ do |f|
  if f == "am"
  	visit signin_path
  	puts Factory(:user)
  	sign_in(Factory(:user))
  end
end

When /^I log in as the correct user$/ do
  sign_in(user)
end

def sign_in(the_user)
	puts the_user.password
	fill_in 'Email',	:with => the_user.email
  fill_in 'Password',:with => "secret"
  click_button 'Sign in'
end

def user
   User.first || Factory(:user)
end

