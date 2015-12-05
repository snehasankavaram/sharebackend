class RemoveIdFieldsFromProfile < ActiveRecord::Migration
  def change
  	remove_column :profiles, :user_id
  	remove_column :profiles, :contact_id
  	add_column :users, :user_profile_id, :integer
  	add_column :contacts, :user_profile_id, :integer
  end
end
