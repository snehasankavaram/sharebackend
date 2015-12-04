class DbFile < ActiveRecord::Base
	belongs_to :user
	has_many :view_metadata
end
