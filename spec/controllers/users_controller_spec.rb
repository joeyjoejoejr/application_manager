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

	describe "POST 'create'" do
	  	describe "failure" do
	  		before(:each) do
	  			@attr = Factory.attributes_for(:user, :first_name => "", :email =>"", :password => "secret", :password_confirmation => "secret" )
	  		end

	  		it "should not create a user" do
	  			lambda do
	  				post :create, :user => @attr
	  			end.should_not change(User, :count)
	  		end

	  		it "should have the right title" do
	  			post :create, :user => @attr
	  			response.should have_selector("title", :content => "Sign up")
	  		end

	  		it "should render the 'new' page" do
	  			post :create, :user => @attr
	  			response.should render_template('new')
	  		end
	  	end

	  	describe "success" do
	  		before(:each) do
	  			@attr = Factory.attributes_for(:user)
	  		end

	  		it "should create a user" do
	  			lambda do
	  				post :create, :user => @attr
	  			end.should change(User, :count).by(1)
	  		end

	  		it "should redirect to the user show page" do
	  			post :create, :user => @attr
	  			response.should redirect_to(user_path(assigns(:user)))
	  		end
	  		
	  		it "should sign in user" do
				post :create, :user => @attr
				controller.current_user == @user
				controller.should be_signed_in
			end
	  	end
  	end
end
