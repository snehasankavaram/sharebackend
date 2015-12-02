class DbFilesController < ApplicationController
  protect_from_forgery

  def create
  	@user = User.find_by(username: params[:username])
  	drop_box_link = params[:link]

  	new_file = DbFile.new(:link => drop_box_link)
  	new_file.user = @user
  	new_file.save
    head :ok, content_type: "text/html"
  end

  def update
  	@file = DbFile.find(params[:id])
  	@file.update(:view_count => params[:view_count])
    head :ok, content_type: "text/html"
  end

  def index
  	@user = User.find_by(username: params[:username])
  	render json: { files: @user.files }
  end
end
