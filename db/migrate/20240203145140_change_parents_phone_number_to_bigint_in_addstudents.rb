class ChangeParentsPhoneNumberToBigintInAddstudents < ActiveRecord::Migration[7.1]
  def change
    change_column :addstudents, :parents_phone_number, :bigint
  end
end
