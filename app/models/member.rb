class Member < ApplicationRecord
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :nullify
  has_many :cart_items, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #include JpPrefecture
  #jp_prefecture :prefecture_code
  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

  def full_name
    "#{self.last_name} #{self.first_name}"
  end
end
