# frozen_string_literal: true

FactoryBot.define do
  factory :kudo do
    title { Faker::Superhero.name }
    content { Faker::TvShows::Friends.quote }
    giver_of_kudo factory: :employee
    receiver_of_kudo factory: :employee
  end
end
