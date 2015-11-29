class AddFieldsToUser < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.string :email
  		t.string :phone
  		t.string :occupation
	end
  end
end
