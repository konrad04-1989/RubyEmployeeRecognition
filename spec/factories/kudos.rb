# frozen_string_literal: true

FactoryBot.define do
  factory :kudo do
    sequence(:title) { |n| "Title of Kudo #{n}" }
    sequence(:content) { |n| "Content of Kudo #{n}" }
    giver_of_kudo factory: :employee
    receiver_of_kudo factory: :employee
  end
end
