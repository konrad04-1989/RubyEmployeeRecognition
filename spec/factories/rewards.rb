# frozen_string_literal: true

FactoryBot.define do
  factory :reward do
    sequence(:title) { |n| "Title of Reward #{n}" }
    sequence(:description) { |n| "Description of Reward #{n}" }
    price { rand(1..10) }
  end
end
