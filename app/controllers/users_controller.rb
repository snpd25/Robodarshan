class UsersController < ApplicationController
	      before_action :admin_user, only: [:destroy, :update, :edit]
	    before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
	
	  #before_action :correct_user,   only: [:edit, :update]
	

	  def index
	  	@users = User.paginate(page: params[:page])
	  end

  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  	@projects = @user.projects.paginate(page: params[:page])
  end

  def projects_approve
  	@users = User.paginate(page: params[:page])
  end

  def admin_approve
  	@users = User.paginate(page: params[:page])
  end

  def update_admin
  	@user = User.find(params[:id])
  	@user.admin = true
  	@user.save
  	flash[:success]="#{@user.name} is now an admin"
  end

  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
    	log_in @user
    	flash[:success] = "You have successfully signed up!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

    def user_params
  		params.require(:user).permit(:name, :email, :enroll, :password,
                                   :password_confirmation, :admin)
    end

    def logged_in_user
      unless logged_in?
      	store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless (current_user && current_user.admin?)
    end
end
