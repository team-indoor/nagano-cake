class Order < ApplicationRecord
  belongs_to :member
  has_many :order_details, dependent: :destroy
  

  validates :total_price, presence: true
  validates :reciever, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  
end
