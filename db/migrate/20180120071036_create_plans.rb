class CreatePlans < ActiveRecord::Migration[5.1]
  def change
		create_table :plans do |t|
			t.date :departure_date
			t.date :return_date
			t.text :description

      t.timestamps
    end
  end
end
