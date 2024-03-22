class ChangePhoneNumberToBigintInAddstudents < ActiveRecord::Migration[7.1]
  def change
    change_column :addstudents, :phone_number, :bigint
  end
end
