class AddDestinationFormattedAddressToRide < ActiveRecord::Migration[5.1]
  def change
    add_column :rides, :destination_formatted_address, :string
  end
end
