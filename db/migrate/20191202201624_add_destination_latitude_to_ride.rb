class AddDestinationLatitudeToRide < ActiveRecord::Migration[5.1]
  def change
    add_column :rides, :destination_latitude, :float
  end
end
