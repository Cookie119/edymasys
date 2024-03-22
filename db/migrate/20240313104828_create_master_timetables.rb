class CreateMasterTimetables < ActiveRecord::Migration[7.1]
  def change
    create_table :master_timetables do |t|
      t.references :subject, null: false, foreign_key: true
      t.references :division, null: false, foreign_key: true
      t.references :teacher, null: false, foreign_key: true
      t.references :time_slot, null: false, foreign_key: true
      t.timestamps
    end
  end
end
