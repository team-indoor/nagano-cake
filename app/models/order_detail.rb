class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :product_id, presence: true
  validates :amount,     presence: true
  validates :price,      presence: true
  validates :order_id,   presence: true
end
