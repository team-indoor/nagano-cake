class Address < ApplicationRecord
  belongs_to :member

  validates :postal_code, presence: true, length: { is: 7 }, numericality: { only_integer: true }
  validates :address, presence: true
  validates :reciever, presence: true

  def address_all
    "#{self.postal_code} #{self.address} #{self.reciever}"
  end
  
end
