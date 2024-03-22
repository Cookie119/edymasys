class AddDeletedAtToAddstudents < ActiveRecord::Migration[7.1]
  def change
    add_column :addstudents, :deleted_at, :datetime
    add_index :addstudents, :deleted_at
  end
end
