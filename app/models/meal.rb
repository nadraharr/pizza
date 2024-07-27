class Meal < ApplicationRecord
  enum category: { pizza: 0, burger: 1, drink: 2 }, _suffix: :category
end
