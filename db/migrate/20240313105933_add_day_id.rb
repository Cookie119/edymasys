class AddDayId < ActiveRecord::Migration[7.1]
  def change
    add_reference :master_timetables, :day, foreign_key: true
  end
end
