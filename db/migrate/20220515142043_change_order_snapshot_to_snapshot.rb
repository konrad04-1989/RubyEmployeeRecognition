class ChangeOrderSnapshotToSnapshot < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :order_snapshot, :snapshot
  end
end
