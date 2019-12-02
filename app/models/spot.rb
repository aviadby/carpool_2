class Spot < ApplicationRecord
  # Direct associations

  belongs_to :joiner,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

end
