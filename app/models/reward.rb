# frozen_string_literal: true

class Reward < ApplicationRecord
  validates :title, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 2 }
  validates :description, presence: true, length: { minimum: 2 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1 }
  has_many :orders, dependent: :destroy
  has_many :buyers, through: :orders, class_name: 'Employee'
end
