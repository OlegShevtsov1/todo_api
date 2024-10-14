FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password }

    trait :example do
      name { Examples::UserData.name }
      email { Examples::UserData.email }
      password { Examples::UserData.password }
    end
  end
end
