class FileNameAddition < ActiveRecord::Migration
  def change
  	add_column :db_files, :file_name, :string
  end
end
