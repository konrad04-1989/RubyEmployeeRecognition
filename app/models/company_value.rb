# frozen_string_literal: true

class CompanyValue < ApplicationRecord
  validates :title, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 2 }

  has_many :kudos, dependent: :destroy
end
