# frozen_string_literal: true

class Order < ApplicationRecord
  serialize :snapshot

  belongs_to :employee
  belongs_to :reward

  delegate :price, to: :snapshot, prefix: true
end
