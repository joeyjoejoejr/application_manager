class UsersController < ApplicationController
	before_filter :authenticate, :only => [:index, :show, :edit, :update, :destroy]
	before_filter :correct_user, :only => [:show, :edit, :update]
	before_filter :admin_user, :only => [:destroy,]
	before_filter :signedin_user, :only => [:new, :create]
	
	def index
		@title = "All Applicants"
		@users = User.paginate(:page => params[:page])
	end
	
	def show
		@user = User.find(params[:id])
		@title = "#{@user.first_name} #{@user.last_name}"
	end
	
	def new
		@user = User.new
		@title = "Sign up"
	end

	def create
		@user = User.new(params[:user])
  		if @user.save
  			flash[:success] = "Welcome to the 8 Rivers!"
  			sign_in @user
  			redirect_to @user
 	 	else
	  		@title = "Sign up"
	  		@user.password = ""
	  		@user.password_confirmation = ""
	  		render 'new'
	  	end
	end
	
	def edit
		@user = User.find(params[:id])
		@title = "Edit user"
	end
	
	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			flash[:success] = "Profile updated."
			redirect_to @user
		else
			@title = 'Edit user'
			render 'edit'
		end
	end
	
	def destroy
		user = User.find(params[:id])
		flash[:success] = "User destroyed."
		user.destroy unless user == current_user
		redirect_to users_path
	end
	
	private
	
		def authenticate
			store_path
			redirect_to signin_path  unless signed_in?
		end
		
		def correct_user
			@user = User.find(params[:id])
			redirect_to root_path unless @user == current_user || current_user.admin?
		end
		
		def admin_user
			redirect_to(root_path) if current_user.nil? || !current_user.admin?
		end
		
		def signedin_user
			redirect_to(root_path) if signed_in?
		end
end
