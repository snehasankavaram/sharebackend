class AddFieldsToViewMetadata < ActiveRecord::Migration
  def change
      add_column :view_metadata, :view_username, :string
      add_reference :view_metadata, :db_file, index: true
  end
end
