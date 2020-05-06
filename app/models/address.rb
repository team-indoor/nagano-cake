class Address < ApplicationRecord
  belongs_to :member

  validates :postal_code, presence: true
  validates :address, presence: true
  validates :reciever, presence: true

    #include JpPrefecture
  #jp_prefecture :prefecture_code
  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
  
  def address_all
    "#{self.postal_code} #{self.address} #{self.reciever}"
  end
  
end
