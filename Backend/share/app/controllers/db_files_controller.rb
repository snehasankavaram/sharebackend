class DbFilesController < ApplicationController
  protect_from_forgery

  def create
  	@user = User.find_by(username: params[:username])
  	drop_box_link = params[:link]

  	new_file = DbFile.new(file_params)
    new_file.view_count = 0
  	new_file.user = @user
  	new_file.save
    head :ok, content_type: "text/html"
  end

  def update
  	@file = DbFile.find(params[:id])

    #set view count
  	@file.update(file_params)

    #create new metadata object and set file of that object to this file
    if params[:viewed_by] != nil
      metadata = ViewMetadatum.new(:view_username => params[:viewed_by]);
      metadata.db_file = @file
      metadata.save
    end

    head :ok, content_type: "text/html"
  end

  def index
  	@user = User.find_by(username: params[:username])

    render_list = [];

    for file in @user.db_files do
      file_hash = Hash.new
      file_hash["file"] = file
      file_hash["metadata"] = file.view_metadata
      render_list << file_hash
    end
    render json: { files: render_list }
  end

  def delete
    @file = DbFile.find(params[:id])
    @file.delete
    head :ok, content_type: "text/html"
  end

  private
    def file_params
      params.permit(:link, :view_count, :local_path, :file_name)
    end

end
