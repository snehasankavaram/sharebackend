class ConnectionController < ApplicationController
	protect_from_forgery
	# "Creates" a connection, adds to hashMap based on color, timestamp, and location
	def create
		latitude = params[:latitude]
		longitude = params[:longitude]
		color = params[:color]
		username = params[:username]
		connection_time = Time.now

		color_bucket = Connection.where(color: color)
		if color_bucket.length == 0
			connection = Connection.create(:color => color, :latitude=>latitude, :longitude=>longitude)
			# add yourself in connection
			connection.users << User.find_by(username: username)
			connection.save


		elsif color_bucket.length == 1
			# add yourself to connection in color bucket
			connection = color_bucket[0]
			connection.users << User.find_by(username: username)


		else
			time_bucket = [];
			for connection in color_bucket do
				# look for connection that is within 1 minute
				if connection.created_at > connection_time - 1.minute
					time_bucket << connection
				end
			end
			if time_bucket.length == 1
				#add yourself to connection
				connection.users << User.find_by(username: username)

			else
				location_bucket = []
				#TODO: add yourself to closest location connection
			end

		end
		head :ok, content_type: "text/html"
	end

	# returns the people in the bucket we need (with your username)
	def show
		color = params[:color]
		username = params[:username]
		current_user = User.find_by(username: username)

		@user_connection = nil
		connections = Connection.where(:color => color)

		for connection in connections
			if connection.users.include? current_user
				@user_connection = connection
				break
			end
		end
		if (@user_connection == nil)
			render json: { connection: nil }

		else
			render json: { connection: @user_connection.users }
		end

		# if @connection.users.length >= 2
		# 	@connection.destroy
		# end
	end
end
