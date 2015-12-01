class AddConnectionToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :connection, index: true
  end
end
