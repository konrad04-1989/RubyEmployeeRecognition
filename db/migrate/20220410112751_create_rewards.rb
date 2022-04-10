class CreateRewards < ActiveRecord::Migration[6.1]
  def change
    create_table :rewards do |t|
      t.string :title, null: false, index: { unique: true }
      t.string :description, null: false

      t.timestamps
    end
  end
end
