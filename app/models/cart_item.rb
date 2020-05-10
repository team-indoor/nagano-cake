class CartItem < ApplicationRecord
  belongs_to :member
  belongs_to :product

  validates :member_id,  cart_item: true, on: :create
  validates :product_id, cart_item: true, on: :create
end
