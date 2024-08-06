class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_many :order_items, dependent: :destroy
  has_many :meals, through: :order_items
  accepts_nested_attributes_for :order_items

  validates :status, presence: true
  before_save :calculate_total
  enum status: { pending: 0, confirmed: 1, shipped: 2, delivered: 3, canceled: 4 }, _suffix: :status

  def calculate_total
    self.total_price = order_items.sum("quantity * price")
  end
end
