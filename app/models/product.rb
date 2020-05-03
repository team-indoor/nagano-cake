class Product < ApplicationRecord
  belongs_to :category, optional: true
  has_many :order_details, dependent: :nullify
  has_many :cart_items, dependent: :destroy

  attachment :image

  validates :name, presence: true
  validates :price, presence: true
  validates :introduction, length: {maximum:200}
  
end
