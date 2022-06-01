class AddIndexToOrders < ActiveRecord::Migration[6.1]
  def change
    add_index :orders, :status
  end
end
