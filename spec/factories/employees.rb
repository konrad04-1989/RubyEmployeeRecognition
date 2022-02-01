# frozen_string_literal: true

FactoryBot.define do
  factory :employee do
    email { Faker::Internet.email }
    encrypted_password { Faker::Internet.password }
  end
end
