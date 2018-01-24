class Location < ApplicationRecord
	geocoded_by :name

	belongs_to :plan

	validates :name, :latitude, :longitude, :plan_id, presence: true
end
