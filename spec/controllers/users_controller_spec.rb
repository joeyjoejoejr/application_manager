require 'spec_helper'

describe UsersController do
	render_views
	
	describe "GET 'index'" do
		
		describe "for non-signed in users" do
			it "should deny access" do
				get :index
				response.should redirect_to(signin_path)
			end
		end
		
		describe "for signed in users" do
			before(:each) do
				@user = test_sign_in(Factory(:user))
				second = Factory(:user)
				third = Factory(:user)
				
				@users = [@user, second, third]
				30.times do
					@users << Factory(:user)
				end
			end
			
			it "should be successful" do
				get :index
				response.should be_success
			end
			
			it "should have the right title" do
				get :index
				response.should have_selector("title", :content => "All Applicants")
			end
			
			it "should have an link to the user's application page'" do
        get :index
        @users[0..2].each do |user|
          response.should have_selector("a", :content => "Your Application")
        end
      end

      it "should paginate users" do
        get :index
        response.should have_selector("div.pagination")
        response.should have_selector("span.disabled", :content => "Previous")
        response.should have_selector("a", :href => "/users?page=2",
                                           :content => "2")
        response.should have_selector("a", :href => "/users?page=2",
                                           :content => "Next")
      end
		end
	end
	
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
		    @user = Factory(:user)
		    test_sign_in(@user)
		  end

		  describe "failure" do

		    before(:each) do
		      @attr = { :email => "", :name => "", :password => "",
		                :password_confirmation => "" }
		    end

		    it "should render the 'edit' page" do
		      put :update, :id => @user, :user => @attr
		      response.should render_template('edit')
		    end

		    it "should have the right title" do
		      put :update, :id => @user, :user => @attr
		      response.should have_selector("title", :content => "Edit user")
		    end
		  end

		  describe "success" do

		    before(:each) do
		      @attr = { :first_name => "New Name", :email => "user@example.org",
		                :password => "barbaz", :password_confirmation => "barbaz" }
		    end

		    it "should change the user's attributes" do
		      put :update, :id => @user, :user => @attr
		      @user.reload
		      @user.first_name.should  == @attr[:first_name]
		      @user.email.should == @attr[:email]
		    end

		    it "should redirect to the user show page" do
		      put :update, :id => @user, :user => @attr
		      response.should redirect_to(user_path(@user))
		    end
		  end
  	end 
  	
  	describe "authentication of edit/update actions" do
  		
  		before(:each) do
  			@user = Factory.create(:user)
  		end
  		
  		describe "for non-signed-in users" do
				it "should deny access to 'edit'" do
					get :edit, :id => @user
					response.should redirect_to(signin_path)
				end
				
				it "should deny access to 'update'" do
					put :update, :id => @user, :user => {}
					response.should redirect_to(signin_path)
				end
			end
			
			describe "for signed-in users" do
				before(:each) do
					wrong_user = Factory.create(:user, :email => "user@example.com")
					test_sign_in(wrong_user)
				end
				
				it "should require matching users for 'edit'" do
					get :edit, :id => @user
					response.should redirect_to(root_path)
				end
				
				it "should require matching users for 'update'" do
					put :edit, :id => @user, :user => {}
					response.should redirect_to(root_path)
				end	
			end
		end
	describe "DELETE 'destroy'" do

    before(:each) do
      @user = Factory(:user)
    end

    describe "as a non-signed-in user" do
      it "should deny access" do
        delete :destroy, :id => @user
        response.should redirect_to(signin_path)
      end
    end

    describe "as a non-admin user" do
      it "should protect the page" do
        test_sign_in(@user)
        delete :destroy, :id => @user
        response.should redirect_to(root_path)
      end
    end

    describe "as an admin user" do

      before(:each) do
        @admin = Factory(:user, :email => "admin@example.com", :admin => true)
        test_sign_in(@admin)
      end
      
      it "should not destroy herself" do
      	lambda do
      		delete :destroy, :id => @admin
      	end.should_not change(User, :count).by(-1)
      end
      
      it "should destroy the user" do
        lambda do
          delete :destroy, :id => @user
        end.should change(User, :count).by(-1)
      end

      it "should redirect to the users page" do
        delete :destroy, :id => @user
        response.should redirect_to(users_path)
      end
    end
  end	
end
