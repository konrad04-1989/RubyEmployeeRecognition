# frozen_string_literal: true

class CompanyValue < ApplicationRecord
  validates :title, presence: true, uniqueness: true, length: { minimum: 2 }
end
