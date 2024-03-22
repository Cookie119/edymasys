class AddDeletedAtToTeachers < ActiveRecord::Migration[7.1]
  def change
    add_column :teachers, :deleted_at, :datetime
    add_index :teachers, :deleted_at
  end
end
