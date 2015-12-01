class User < ActiveRecord::Base
	has_many :contacts
	has_many :db_files
end
