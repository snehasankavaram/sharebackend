class AddUserToFiles < ActiveRecord::Migration
  def change
    add_reference :db_files, :user, index: true
  end
end
