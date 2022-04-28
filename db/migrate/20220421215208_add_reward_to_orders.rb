class AddRewardToOrders < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :reward, null: false, foreign_key: true
  end
end
