class AddRideCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :rides_count, :integer
  end
end
