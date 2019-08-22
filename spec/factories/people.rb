# frozen_string_literal: true

FactoryBot.define do
  factory :person do
    first_name { Faker::Name.name }
    last_name { Faker::Name.last_name }
    middle_name { Faker::Name.middle_name }
    sex { Faker::Demographic.sex }
    full_name { Faker::Name.name_with_middle }
  end
end
