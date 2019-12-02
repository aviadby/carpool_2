class AddOriginLatitudeToRide < ActiveRecord::Migration[5.1]
  def change
    add_column :rides, :origin_latitude, :float
  end
end
