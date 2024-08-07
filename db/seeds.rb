User.create(email: "admin@test.com", role: "admin", password: "qweqwe", password_confirmation: "qweqwe")
User.create(email: "user@test.com", role: "basic", password: "qweqwe", password_confirmation: "qweqwe")
User.update_all confirmed_at: DateTime.now

file_path = Rails.root.join("db", "meals.json")
meals = JSON.parse(File.read(file_path))

meals.each do |meal_params|
  Meal.find_or_create_by!(meal_params)
end
Meal.update_all(in_menu: true, category: "pizza")
