class UsersController < ApplicationController
  protect_from_forgery
  def show
  	 @user = User.find_by(username: params[:username])
     render json: { user: @user }
  end

  def create
    @existing_user = User.find_by(username: params[:username])
    if existing_user == nil
  	   @user = User.new(user_params)
  	   @user.save
    end
    head :ok, content_type: "text/html"
  end

  private
	  def user_params
	    params.permit(:username, :name, :password, :email, :phone, :occupation)
	  end
end
