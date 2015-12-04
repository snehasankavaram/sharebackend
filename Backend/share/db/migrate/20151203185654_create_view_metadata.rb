class CreateViewMetadata < ActiveRecord::Migration
  def change
    create_table :view_metadata do |t|

      t.timestamps
    end
  end
end
