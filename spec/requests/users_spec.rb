require 'spec_helper'

describe "Users" do

  describe "sign in/out" do

    describe "success" do
      it "should sign a user in and out" do
        user = Factory.create(:user)
        visit signin_path
        fill_in :email,    :with => user.email
        fill_in :password, :with => user.password
        click_button
        controller.should be_signed_in
        click_link "Sign out"
        controller.should_not be_signed_in
      end
    end
  end
end
