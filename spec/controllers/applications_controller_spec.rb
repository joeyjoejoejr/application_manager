require 'spec_helper'

describe ApplicationsController do
  render_views
  
  describe "GET 'show'" do
    before(:each) do
      @user = Factory(:user)
      @application = @user.create_application( :zip_code => 27777, 
                    :phone_number => "919-593-6666")
    end
    
    describe "failure" do
      
      it "should not be accessible to logged out users" do
        get :show, :id => @user
        response.should redirect_to(signin_path)
      end
      
      it "should not be accessible to the wrong user" do
        wrong_user = Factory(:user)
        test_sign_in(wrong_user)
        get :show, :id => @user
				response.should redirect_to(root_path)
      end
    end
    
    describe "sucess" do
    
    end
  end

  describe "GET 'new'" do

    before(:each) do
      @user = Factory(:user)
    end
    
    describe "sucess" do
      
      before(:each) do
        test_sign_in(@user)
      end
      
      it "returns http success" do
        get :new
        response.should be_success
      end
      
      it "Should have the right title" do
        get :new
        response.should have_selector("title", :content => "New Application")
      end
      
      describe "form elements" do
        
        it "should have the user's information" do
          get :new
          response.should have_selector("h1", :content => "#{@user.first_name} #{@user.last_name}")
        end
        
        it "should have an address field" do
	        get :new
	        response.should have_selector("input[name='application[address]'][type='text']")
	      end
	      
	      it "should have a city field" do
	        get :new
	        response.should have_selector("input[name='application[city]'][type='text']")
	      end
	      
	      it "should have a state field" do
	        get :new
	        response.should have_selector("input[name='application[state]'][type='text']")
	      end
	      
	      it "should have a zip code field" do
	         get :new
	         response.should have_selector("input[name='application[zip_code]'][type='text']")
	       end
	       
	      it "should have a phone number field" do
	        get :new
	        response.should have_selector("input[name='application[phone_number]'][type='text']")
	      end
         
      end
    end
    
    it "should deny access to non signed in" do
      get :new
      should redirect_to(signin_path)
    end
    
  end

  describe "Post 'create'" do
    
    describe 'failure' do

      before(:each) do
        @user = Factory(:user)
        test_sign_in(@user)
        @attr = { :zip_code => 1 }
      end
      
      it "should not create an application" do
	  		lambda do
	  			post :create, :application => @attr
	  		end.should_not change(Application, :count)
	 		end

	 		it "should have the right title" do
	  		post :create, :application => @attr
	 			response.should have_selector("title", :content => "New Application")
  		end

  		it "should render the 'new' page" do
	 			post :create, :application => @attr
  			response.should render_template('new')
   		end
      
    end
    
    describe 'success' do
      before(:each) do
        @user = Factory(:user)
        test_sign_in(@user)
        @attr = { :address => "123 main st", :city => "Anywhere", :state => 'NC',
                  :zip_code => 27777, :phone_number => "919-111-1111" }
      end
      
      it "should create a new user" do
        lambda do
	  			post :create, :application => @attr
	  		end.should change(Application, :count)
      end
      
      it "should redirect to the application show page" do
        post :create, :application => @attr
        response.should redirect_to(application_path(assigns(:application)))
      end
    end
  
  end

  describe "GET 'edit'" do

  end

  describe "GET 'update'" do

  end

  describe "GET 'destroy'" do

  end

end
