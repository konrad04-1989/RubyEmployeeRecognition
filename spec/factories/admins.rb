# frozen_string_literal: true

FactoryBot.define do
  factory :admin do
    email { 'admin@admin.com' }
    password { 'password' }
  end
end
