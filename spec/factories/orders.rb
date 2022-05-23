# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    reward
    snapshot factory: :reward
  end
end
