class RemoveIndexFromNumberOfAvailableKudos < ActiveRecord::Migration[6.1]
  def change
    remove_index :employees, :number_of_available_kudos
  end
end
