class CreateKudos < ActiveRecord::Migration[6.1]
  def change
    create_table :kudos do |t|
      t.string :title
      t.text :content
      t.integer :giver_id
      t.integer :receiver_id

      t.timestamps
    end
    add_index :kudos, :giver_id
    add_index :kudos, :receiver_id
  end
end
