class AddSpotCountToRides < ActiveRecord::Migration[5.1]
  def change
    add_column :rides, :spots_count, :integer
  end
end
