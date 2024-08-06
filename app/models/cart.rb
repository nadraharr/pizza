class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :cart_items, dependent: :destroy

  before_save :calculate_total

  def calculate_total
    self.total_price = cart_items.sum("quantity * price")
  end
end
