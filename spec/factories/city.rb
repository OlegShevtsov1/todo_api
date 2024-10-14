FactoryBot.define do
  factory :city do
    name { Faker::Address.unique.city }

    trait :example do
      name { Examples::CityData.name }
    end
  end
end
