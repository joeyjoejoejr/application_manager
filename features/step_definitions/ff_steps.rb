Given /^that I am not signed in$/ do
  @user = User.first || Factory.create(:user)
  visit signout_path
end

When /^I log in as the correct user$/ do
  fill_in :email,	:with => @user.email
  fill_in :password,:with => @user.password
  click_button :sign_in
end

