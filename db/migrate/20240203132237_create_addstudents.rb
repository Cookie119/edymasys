class CreateAddstudents < ActiveRecord::Migration[7.1]
  def change
    create_table :addstudents do |t|
      t.string :photograph
      t.string :first_name
      t.string :middle_name
      t.string :surname
      t.date :date_of_birth
      t.string :gender
      t.integer :phone_number
      t.string :email
      t.string :address
      t.string :fathers_name
      t.string :mothers_name
      t.integer :parents_phone_number
      t.string :job_placement
      t.string :marital_status

      t.timestamps
    end
  end
end
