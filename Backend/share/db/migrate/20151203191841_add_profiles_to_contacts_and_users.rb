class AddProfilesToContactsAndUsers < ActiveRecord::Migration
  def change
  	add_reference :profiles, :user, index: true
  	add_reference :profiles, :contact, index: true
  end
end
