# frozen_string_literal: true

class RewardsController < ApplicationController
  before_action :authenticate_employee!

  # GET /rewards
  def index
    @rewards = Reward.all.sort_by(&:title)
  end

  # GET /rewards/1
  def show
    set_reward
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reward
    @reward = Reward.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reward_params
    params.require(:reward).permit(:title, :description, :price)
  end
end
