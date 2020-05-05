class Address < ApplicationRecord
  belongs_to :member

  def address_all
    "#{self.postal_code} #{self.address} #{self.reciever}"
  end
end
