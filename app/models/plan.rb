class Plan < ApplicationRecord
	has_one :location, dependent: :destroy, class_name: Location
end
