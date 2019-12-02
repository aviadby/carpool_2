class User < ApplicationRecord
  # Direct associations

  has_many   :spots,
             :foreign_key => "joiner_id",
             :dependent => :destroy

  has_many   :rides,
             :foreign_key => "ride_leader",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
