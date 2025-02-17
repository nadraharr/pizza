class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :meal

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
