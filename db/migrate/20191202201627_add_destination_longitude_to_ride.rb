class AddDestinationLongitudeToRide < ActiveRecord::Migration[5.1]
  def change
    add_column :rides, :destination_longitude, :float
  end
end
