class CreateNotices < ActiveRecord::Migration[7.1]
  def change
    create_table :notices do |t|
      t.string :title
      t.text :content
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
