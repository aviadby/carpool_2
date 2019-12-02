class AddOriginLongitudeToRide < ActiveRecord::Migration[5.1]
  def change
    add_column :rides, :origin_longitude, :float
  end
end
