class AddDeletedAtToNotices < ActiveRecord::Migration[7.1]
  def change
    add_column :notices, :deleted_at, :datetime
    add_index :notices, :deleted_at
  end
end
