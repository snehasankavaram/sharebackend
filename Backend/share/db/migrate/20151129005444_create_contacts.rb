class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :username
      t.string :name
      t.string :email
      t.string :phone
      t.string :occupation

      t.timestamps
    end
  end
end
