class AddPriceToRewards < ActiveRecord::Migration[6.1]
  def change
    add_column :rewards, :price, :decimal, null: false, :precision => 11, :scale => 2
  end
end
