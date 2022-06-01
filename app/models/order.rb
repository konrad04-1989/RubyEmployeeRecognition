# frozen_string_literal: true

class Order < ApplicationRecord
  serialize :snapshot
  enum status: { not_delivered: 0, delivered: 1 }, _prefix: :status, _default: 'not_delivered'

  belongs_to :employee
  belongs_to :reward

  delegate :price, to: :snapshot, prefix: true
end
