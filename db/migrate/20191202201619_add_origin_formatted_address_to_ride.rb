class AddOriginFormattedAddressToRide < ActiveRecord::Migration[5.1]
  def change
    add_column :rides, :origin_formatted_address, :string
  end
end
