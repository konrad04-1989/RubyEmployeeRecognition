# frozen_string_literal: true

class Order < ApplicationRecord
  serialize :order_snapshot

  belongs_to :employee
  belongs_to :reward

  delegate :price, to: :order_snapshot, prefix: true
end
