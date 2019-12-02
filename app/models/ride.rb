class Ride < ApplicationRecord
  # Direct associations

  belongs_to :leader,
             :class_name => "User",
             :foreign_key => "ride_leader",
             :counter_cache => true

  # Indirect associations

  # Validations

end
