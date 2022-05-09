class AddOrderSnapshotToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :order_snapshot, :text, null: false
  end
end
