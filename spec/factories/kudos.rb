# frozen_string_literal: true

FactoryBot.define do
    factory :kudo do
      title { Faker::Superhero.name }
      content { Faker::TvShows::Friends.quote }
      giver_id { Faker::Number.between(from: 1, to: 5) }
      receiver_id { Faker::Number.between(from: 1, to: 5) }
    end
  end
  