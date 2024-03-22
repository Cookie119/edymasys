class AddDeletedAtToGalleries < ActiveRecord::Migration[7.1]
  def change
    add_column :galleries, :deleted_at, :datetime
    add_index :galleries, :deleted_at
  end
end
