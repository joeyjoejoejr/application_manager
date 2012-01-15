require 'spec_helper'

describe UsersController do
	render_views

	describe "GET 'new" do
		it "should be sucessful" do
			get 'new'
			response.should be_success
		end

		it "should have the right title" do
			get 'new'
			response.should have_selector("title", :content => "Sign up")
		end

		it "should have a first name field" do
	      get :new
	      response.should have_selector("input[name='user[first_name]'][type='text']")
	    end

	    it "should have a last name field" do
	      get :new
	      response.should have_selector("input[name='user[last_name]'][type='text']")
	    end

	    it "should have an email field" do
	    	get :new
	    	response.should have_selector("input[name='user[email]'][type='text']")
	    end

	    it "should have a password field" do
	    	get :new
	    	response.should have_selector("input[name='user[password]'][type='password']")
	    end

	    it "should have a password confirmation field" do
	    	get :new
	    	response.should have_selector("input[name='user[password_confirmation]'][type='password']")
	    end
	end

end
