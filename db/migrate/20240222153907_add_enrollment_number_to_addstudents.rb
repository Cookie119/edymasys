class AddEnrollmentNumberToAddstudents < ActiveRecord::Migration[7.1]
  def change
    add_column :addstudents, :enrollment_number, :string
    add_index :addstudents, :enrollment_number, unique: true
  end
end
