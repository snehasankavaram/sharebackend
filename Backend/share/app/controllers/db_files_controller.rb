class DbFilesController < ApplicationController
  protect_from_forgery

  def create
  	@user = User.find_by(username: params[:username])
  	drop_box_link = params[:link]

  	new_file = DbFile.new(:link => drop_box_link)
  	new_file.user = @user
  	new_file.save

  end

  def update
  	@file = DbFile.find(params[:id])
  	@file.update(:view_count => params[:view_count])
  end

  def index
  	@user = User.find_by(username: params[:username])
  	render json: { files: @user.files }
  end
end
