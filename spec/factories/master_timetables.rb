FactoryBot.define do
    factory :master_timetable do
      day_id { create(:day).id }
      time_slot_id { create(:time_slot).id }
      subject_id { create(:subject).id }
      division_id { create(:division).id }
      teacher_id { create(:teacher).id }
    end
end