FactoryBot.define do
    factory :teacher do
        name{  Faker::Name.name }
      designation { Faker::Job.title }
      qualification { Faker::Educator.degree }
      experience { Faker::Number.between(from: 1, to: 30) }
      area_of_expertise { Faker::Job.field }
      department { Faker::Job.field }
      image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 't1.jpg'), 'image/jpeg') }
    end
  end
  