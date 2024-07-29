class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :meal

  before_save :set_price
  validates :quantity, presence: true, numericality: { greater_than: 0 }

  private

  def set_price
    self.price = meal.price
  end
end
