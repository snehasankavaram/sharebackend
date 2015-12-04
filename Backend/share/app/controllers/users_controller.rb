class UsersController < ApplicationController
  protect_from_forgery
  def show
  	 @user = User.find_by(username: params[:username])
     render json: { user: @user, profile: @user.profile}
  end

  def create
    @existing_user = User.find_by(username: params[:username])
    if @existing_user == nil
       @profile = Profile.new(profile_params)
  	   @profile.save

       @user = User.new(user_params)
       @user.profile = @profile
  	   @user.save
    end
    head :ok, content_type: "text/html"
  end

  def update
    @user = User.find_by(username: params[:username])
    @user.update(user_params)
    @user.profile.update(profile_params)
    head :ok, content_type: "text/html"
  end

  private
	  def user_params
	    params.permit(:username, :password)
	  end

    def profile_params
      params.permit(:name, :email, :phone, :occupation)
    end
end
