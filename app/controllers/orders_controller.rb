# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_employee!

  # GET /orders
  def index
    @orders = Order.all.where(employee: current_employee)
  end

  # POST /orders
  def create
    if current_employee.number_of_points >= reward.price
      Order.create(employee: current_employee, reward: reward, order_snapshot: reward)
      redirect_to orders_path, notice: 'Reward was successfully purchased.'
    else
      redirect_to rewards_path, alert: "Sorry, You don't have enough points."
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  def reward
    @reward = Reward.find(params[:reward_id])
  end
end
