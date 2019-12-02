class CreateSpots < ActiveRecord::Migration[5.1]
  def change
    create_table :spots do |t|
      t.integer :ride_id
      t.integer :joiner_id

      t.timestamps
    end
  end
end
