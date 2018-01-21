class Location < ApplicationRecord
	geocoded_by :name

	belongs_to :plan
end
