FactoryBot.define do
    factory :subject do
      name { Faker::Name.unique.name }
    end
  end
  