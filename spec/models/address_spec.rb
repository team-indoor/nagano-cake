require 'rails_helper'

RSpec.describe Address, type: :model do

  describe "配送先の登録" do
    context "有効な登録" do
      it "通常登録" do
        member = create(:member)
        address = build(:address, member_id: member.id)
        expect(address).to be_valid
      end
    end
    context "無効な登録" do
      before do
        @member = create(:member)
        @address = build(:address, member_id: @member.id)
      end
      it "退会済みのユーザーの配送先登録" do
        @member.update(is_active: false)
        expect(@address).to_not be_valid
      end
      it "郵便番号が空欄" do
        @address.update(postal_code: " ")
        expect(@address).to_not be_valid
      end
      it "住所が空欄" do
        @address.update(address: " ")
        expect(@address).to_not be_valid
      end
      it "宛先が空欄" do
        @address.update(reciever: " ")
        expect(@address).to_not be_valid
      end
    end
  end

end
