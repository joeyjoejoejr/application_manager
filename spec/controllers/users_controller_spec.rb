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
	  			@attr = Factory.attributes_for(:user, :first_name => "", :email =>"", 
	  										   :password => "secret", :password_confirmation => "secret" )
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
	  
	  describe "GET 'edit'" do
	  	before(:each) do
	  		@user = Factory.create(:user)
	  		test_sign_in(@user)
	 		end
	  	 
	 		it "should be successful" do
  			get :edit, :id => @user
  			response.should be_success
  		end
	  		
	  	it "should have the right title" do
	  		get :edit, :id => @user
	 			response.should have_selector('title', :content => 'Edit user')
	 		end 
 		end
  	
  	describe "PUT 'update'" do
  		
  		before(:each) do
  			@user = Factory.create(:user)
  			test_sign_in(@user)
  		end
 
  		describe "failure" do
  			
  			before(:each) do
  				@attr = { :first_name => "", :email => "", :passowrd => "", 
  			    		   :password_confirmation => ""}
  			end
  			
  			it "should render the 'edit' page" do
  				put :update, :id => @user, :user => @attr
  				response.should render_template('edit')
  			end
  			
  			it "should have the right title" do
  				put :update, :id => @user, :user => @attr
	  			response.should have_selector('title', :content => 'Edit user')
	  		end 
	  		
  		end
  		
  		describe "success" do
  			
  			before(:each) do
  				@attr = { :first_name => "New", :last_name => "User", 
  									:email => "user@example.com", :password => "barbaz",
  						  		:password_confirmation => "barbaz" }
  			end
  			
  			it "should change the user's attributes" do
  				put :update, :id => @user, :user => @attr
  				user = assigns(:user)
  				@user.reload
  				@user.first_name.should == user.first_name
  				@user.last_name.should == user.last_name
  				@user.email.should == user.email
   				@user.hashed_password.should == user.hashed_password
   			end
   		end
  	end
  	
  	describe "authentication of edit/update actions" do
  		
  		before(:each) do
  			@user = Factory.create(:user)
  		end
  		
  		it "should deny access to 'edit'" do
  			get :edit, :id => @user
  			response.should redirect_to(signin_path)
  		end
  		
  		it "should deny access to 'update'" do
  			put :update, :id => @user, :user => {}
  			response.should redirect_to(signin_path)
  		end
  	end
end
