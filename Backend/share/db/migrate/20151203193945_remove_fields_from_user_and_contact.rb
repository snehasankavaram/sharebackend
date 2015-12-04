class RemoveFieldsFromUserAndContact < ActiveRecord::Migration
  def change
  	remove_column :users, :phone
	remove_column :users, :name
	remove_column :users, :email
	remove_column :users, :occupation

	remove_column :contacts, :phone
	remove_column :contacts, :name
	remove_column :contacts, :email
	remove_column :contacts, :occupation
	remove_column :contacts, :username
  end
end
