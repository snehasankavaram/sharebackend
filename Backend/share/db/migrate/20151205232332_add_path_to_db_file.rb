class AddPathToDbFile < ActiveRecord::Migration
  def change
  	add_column :db_files, :local_path, :string
  end
end
