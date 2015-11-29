class CreateDbFiles < ActiveRecord::Migration
  def change
    create_table :db_files do |t|
      t.string :link
      t.integer :view_count

      t.timestamps
    end
  end
end
