# frozen_string_literal: true

FactoryBot.define do
  factory :company_value do
    sequence(:title) { |n| "CompanyValue#{n}" }
  end
end
