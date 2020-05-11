require 'rails_helper'

RSpec.describe Order, type: :model do

  describe "注文する" do
    before do
      @member = create(:member)
      @category = create(:category)
      @product = create(:product, category_id: @category.id)
      @cart_item = create(:cart_item, member_id: @member.id, product_id: @product.id)
      total_price = (@product.price * 1.1).floor * @cart_item.amount
      @order = build(:order, member_id: @member.id, total_price: total_price)
    end
    context "有効な注文" do
      it "通常の注文追加" do
        expect(@order).to be_valid
      end
    end

    context "無効な注文" do
      it "退会済みのユーザーの注文" do
        @member.update(is_active: false)
        expect(@order).to_not be_valid
      end
      it "カートに商品がない場合の注文" do
        @cart_item = nil
        expect(@order).to_not be_valid
      end
      it "合計金額がない" do
        @order.update(total_price: " ")
        expect(@order).to_not be_valid
      end
      it "宛先がない" do
        @order.update(reciever: " ")
        expect(@order).to_not be_valid
      end
      it "郵便番号がない" do
        @order.update(postal_code: " ")
        expect(@order).to_not be_valid
      end
      it "住所がない" do
        @order.update(address: " ")
        expect(@order).to_not be_valid
      end
    end
  end

end
