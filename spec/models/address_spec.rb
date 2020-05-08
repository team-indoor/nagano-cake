require 'rails_helper'

RSpec.describe Address, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe "配送先の登録" do
    context "有効な登録" do
      it "通常登録" do
        member = create(:member)
        address = build(:address)
        address.save
        expect(address).to be_valid
      end
    end
    context "無効な登録" do
      it "退会済みのユーザーの配送先登録" do
        member = build(:member)
        member.is_active = false
        member.save
        address = create(:address)
        expect(address).to_not be_valid
      end
      it "郵便番号が空欄" do
        member = create(:member)
        address = build(:address)
        address.postal_code = " "
        address.save
        expect(address).to_not be_valid
      end
      it "住所が空欄" do
        member = create(:member)
        address = build(:address)
        address.address = " "
        address.save
        expect(address).to_not be_valid
      end
      it "宛先が空欄" do
        member = create(:member)
        address = build(:address)
        address.reciever = " "
        address.save
        expect(address).to_not be_valid
      end
    end
  end

end
