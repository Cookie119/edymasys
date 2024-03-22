
FactoryBot.define do
    factory :time_slot do
      start_time{Time.now}
    end_time{Time.now + 1.hour}
    end
end