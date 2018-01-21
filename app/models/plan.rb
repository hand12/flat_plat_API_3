class Plan < ApplicationRecord
	has_one :location, dependent: :destroy, class_name: Location

	RANGE_DISTANCE_BY_KM = 8
	KM_PER_MI = 1.60934

	def nears
		distance = RANGE_DISTANCE_BY_KM / KM_PER_MI
		center_pointer = [self.location&.latitude, self.location&.longitude]
		Location.near(center_pointer, distance).map(&:plan).reject{ |plan| plan == self }
	end

end
