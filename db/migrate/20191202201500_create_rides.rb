class CreateRides < ActiveRecord::Migration[5.1]
  def change
    create_table :rides do |t|
      t.string :origin
      t.string :destination
      t.datetime :departs
      t.integer :ride_leader

      t.timestamps
    end
  end
end
