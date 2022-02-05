# frozen_string_literal: true

FactoryBot.define do
  factory :employee do
    sequence(:email) { |n| "test#{n}@test.pl" }
    password { Faker::Internet.password }
  end
end
