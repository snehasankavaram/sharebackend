class ContactsController < ApplicationController
	protect_from_forgery

	def index
		@user = User.find_by(username: params[:username])
    	render json: { contact: @user.contacts }
	end

	def show
		@contact = Contact.find(params[:id])
    	render json: { contacts: @contact }
	end
end
