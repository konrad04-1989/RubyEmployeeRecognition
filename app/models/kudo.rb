# frozen_string_literal: true

class Kudo < ApplicationRecord
  validates :title, presence: true, length: { minimum: 2 }
  validates :content, presence: true, length: { minimum: 2 }
  validates :giver_id, presence: true
  validates :receiver_id, presence: true

  belongs_to :giver_of_kudo, class_name: 'Employee', foreign_key: 'giver_id', inverse_of: :given_kudos
  belongs_to :receiver_of_kudo, class_name: 'Employee', foreign_key: 'receiver_id', inverse_of: :received_kudos
end
