class Contact < ActiveRecord::Base
	belongs_to :user
	has_one :profile
end
