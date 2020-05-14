class CartItem < ApplicationRecord
  belongs_to :member
  belongs_to :product

  validates :member_id,  presence: true, cart_item: true, on: :create
  validates :product_id, presence: true, cart_item: true, on: :create
  validates :amount,     presence: true
end
