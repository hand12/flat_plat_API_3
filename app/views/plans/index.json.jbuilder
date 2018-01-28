json.array!@plans do |plan|
	json.id plan.id
	json.departure_date plan.departure_date
	json.return_date plan.return_date
	json.description plan.description
	json.created_at plan.created_at.strftime('%Y/%m/%d %H:%M')
	json.location do
		json.name plan.location&.name
		json.lat plan.location&.latitude
		json.lng plan.location&.longitude
	end
end