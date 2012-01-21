class ApplicationsController < ApplicationController
  before_filter :require_signin
  before_filter :correct_user, :only => [:show, :edit, :update, :destroy]
  
  
  def show
    redirect_to @user
  end

  def new
  	@user = current_user
  	@application = @user.build_application()
  	@title = "New Application"
  end
  
  def create
    @user = current_user
    @application = @user.create_application(params[:application])
    if @user.application.save
      redirect_to @application
    else
      @title = "New Application"
      render 'new'
    end
  end

  def edit
    @user = current_user
    @application = @user.application
    @title = "Edit Application"
  end

  def update
    @user = current_user
    @application = @user.application
    if @application.update_attributes(params[:application])
			redirect_to @user
		else
			@title = 'Edit Application'
			render 'edit'
		end
  end

  def destroy
  end
  
  private
  	
  	def require_signin
  		store_path
  		redirect_to(signin_path) unless signed_in?
  	end
  	
  	def correct_user
			@user = User.find(params[:id])
			redirect_to root_path unless @user == current_user || current_user.admin?
		end
end
