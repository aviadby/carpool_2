require 'open-uri'
class Ride < ApplicationRecord
  before_validation :geocode_destination

  def geocode_destination
    if self.destination.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.destination)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.destination_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.destination_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.destination_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  before_validation :geocode_origin

  def geocode_origin
    if self.origin.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.origin)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.origin_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.origin_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.origin_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  # Direct associations

  has_many   :spots,
             :dependent => :destroy

  belongs_to :leader,
             :class_name => "User",
             :foreign_key => "ride_leader",
             :counter_cache => true

  # Indirect associations

  # Validations

end
