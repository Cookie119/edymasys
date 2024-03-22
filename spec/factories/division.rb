FactoryBot.define do
    factory :division do
      division { Faker::Name.unique.name }
    end
  end
  