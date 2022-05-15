# frozen_string_literal: true

class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :given_kudos, class_name: 'Kudo', foreign_key: 'giver_id', inverse_of: :giver_of_kudo, dependent: :destroy
  has_many :received_kudos, class_name: 'Kudo', foreign_key: 'receiver_id', inverse_of: :receiver_of_kudo, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :rewards, through: :orders

  def number_of_points
    received_kudos.count - orders.sum(&:snapshot_price)
  end
end
