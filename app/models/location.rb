class Location < ApplicationRecord
	geocoded_by :name

	belongs_to :plan

	validates_presence_of :name, :latitude, :longitude, :plan
end
