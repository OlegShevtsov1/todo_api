FactoryBot.define do
  factory :doctor do
    name { Faker::Name.unique.name }
    description { Faker::Name.unique.name }
    age { Faker::Age.unique.age }
    association :user
    association :city

    trait :example do
      name { Examples::DoctorData.name }
      description { Examples::DoctorData.description }
      age { Examples::DoctorData.age }
    end
  end
end
