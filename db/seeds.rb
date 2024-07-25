User.create(email: "admin@test.com", password: "qweqwe", password_confirmation: "qweqwe")
User.create(email: "user@test.com", password: "qweqwe", password_confirmation: "qweqwe")
User.update_all confirmed_at: DateTime.now
