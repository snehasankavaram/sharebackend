class AddConnectionMapToConnection < ActiveRecord::Migration
  def change
  	add_column :connections, :color, :string
  	add_column :connections, :latitude, :float
  	add_column :connections, :longitude, :float
  end
end

