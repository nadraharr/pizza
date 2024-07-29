class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :meals, through: :order_items

  validates :status, presence: true
  before_save :calculate_total
  enum status: { pending: 0, processing: 1, closed: 2 }, _suffix: :status

  def calculate_total
    self.total_price = order_items.sum("quantity * price")
    save
  end
end
