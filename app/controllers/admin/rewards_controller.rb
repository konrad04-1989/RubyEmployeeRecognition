# frozen_string_literal: true

module Admin
  class RewardsController < AdminController
    # GET /admin/rewards
    def index
      @rewards = Reward.all
    end

    # GET /admin/rewards/1
    def show
      set_reward
    end

    # GET /admin/rewards/new
    def new
      @reward = Reward.new
    end

    # GET /admin/rewards/1/edit
    def edit
      set_reward
    end

    # POST /admin/rewards
    def create
      @reward = Reward.new(reward_params)
      if @reward.save
        redirect_to admin_rewards_path, notice: 'Reward was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /admin/rewards/1
    def update
      set_reward
      if @reward.update(reward_params)
        redirect_to admin_rewards_path, notice: 'Reward was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /admin/rewards/1
    def destroy
      set_reward
      @reward.destroy
      redirect_to admin_rewards_url, notice: 'Reward was successfully destroyed.'
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
end
