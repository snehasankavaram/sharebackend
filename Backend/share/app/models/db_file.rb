class DbFile < ActiveRecord::Base
	belongs_to :user
	#TODO: Need fields for metadata, maybe metadata object with contact, time viewed
end
