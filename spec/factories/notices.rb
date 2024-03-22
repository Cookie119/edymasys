FactoryBot.define do
    factory :notice do
      title { "Sample Notice Title" }
      content { "Sample Notice Content" }
      # Add other attributes as needed
    end
    factory :category do
        name { "Example Category" }
      end
  end