class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :occupation

      t.timestamps
    end
  end
end
