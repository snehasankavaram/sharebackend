class ContactsController < ApplicationController
	protect_from_forgery

	#show all the contacts of that username
	def index
		@user = User.find_by(username: params[:username])

		render_list = [];

		for contact in @user.contacts do
			contact_hash = Hash.new
			contact_hash["contact"] = contact
			contact_hash["profile"] = contact.profile
			render_list << contact_hash
		end

    	render json: { contacts: render_list }
	end

	#pass in username you want to show
	def show
		@contact = Contact.find(params[:id])
    	render json: { contact: @contact, profile: @contact.profile }
	end

	def create
		owner = User.find_by(username: params[:my_username])
		user = User.find_by(username: params[:contact_username])
		@contact = Contact.new()
		@contact.profile = user.profile
		@contact.user = owner
		@contact.save
		head :ok, content_type: "text/html"
	end

	def update
		@contact = params[:id]
		@contact.update(contact_params)
		head :ok, content_type: "text/html"
	end

	def delete
		@contact = Contact.find(params[:id])
		@contact.delete
		head :ok, content_type: "text/html"
	end

	private
	  def contact_params
	    params.permit(:notes)
	  end

end
