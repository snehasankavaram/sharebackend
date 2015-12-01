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

	def create
		owner = User.find_by(username: params[:my_username])
		user = User.find_by(username: params[:contact_username])
		@contact = Contact.new(:name => user.name, :email=> user.email, :phone=> user.phone, :occupation=> user.occupation, :username => user.username)
		@contact.user = owner
		@contact.save
	end
end
