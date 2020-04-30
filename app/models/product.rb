class Product < ApplicationRecord
  belongs_to :category
  has_many :order_details, dependent: :nullify
  has_many :cart_items, dependent: :destroy
end
