require 'rails_helper'

RSpec.describe Order, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe "注文する" do
    context "有効な注文" do
      it "通常の注文追加" do
        member = create(:member)
        product = create(:product)
        cart_item = CartItem.create(member_id: member.id, product_id: product.id, amount: 4)
        order = build(:order)
        order.total_price = (product.price * 1.1).floor * cart_item.amount
        order.save
        expect(order).to be_valid
      end
    end

    context "無効な注文" do
      it "退会済みのユーザーの注文" do
        member = build(:member)
        member.is_active = false
        member.save
        product = create(:product)
        cart_item = CartItem.create(member_id: member.id, product_id: product.id, amount: 4)
        order = build(:order)
        order.total_price = (product.price * 1.1).floor * cart_item.amount
        order.save
        expect(order).to_not be_valid
      end
      it "カートに商品がない場合の注文" do
        member = create(:member)
        product = create(:product)
        cart_items = CartItem.where(member_id: member.id)
        if cart_items.empty?
          break
        else
          order = build(:order)
          order.total_price = (product.price * 1.1).floor * cart_item.amount
          order.save
        end
        expect(order).to_not be_valid
      end
      it "合計金額がない" do
        member = build(:member)
        member.is_active = false
        member.save
        product = create(:product)
        cart_item = CartItem.create(member_id: member.id, product_id: product.id, amount: 4)
        order = build(:order)
        order.total_price = " "
        order.save
        expect(order).to_not be_valid
      end
      it "宛先がない" do
        member = build(:member)
        member.is_active = false
        member.save
        product = create(:product)
        cart_item = CartItem.create(member_id: member.id, product_id: product.id, amount: 4)
        order = build(:order)
        order.total_price = (product.price * 1.1).floor * cart_item.amount
        order.reciever = " "
        order.save
        expect(order).to_not be_valid
      end
      it "郵便番号がない" do
        member = build(:member)
        member.is_active = false
        member.save
        product = create(:product)
        cart_item = CartItem.create(member_id: member.id, product_id: product.id, amount: 4)
        order = build(:order)
        order.total_price = (product.price * 1.1).floor * cart_item.amount
        order.postal_code = " "
        order.save
        expect(order).to_not be_valid
      end
      it "住所がない" do
        member = build(:member)
        member.is_active = false
        member.save
        product = create(:product)
        cart_item = CartItem.create(member_id: member.id, product_id: product.id, amount: 4)
        order = build(:order)
        order.total_price = (product.price * 1.1).floor * cart_item.amount
        order.address = " "
        order.save
        expect(order).to_not be_valid
      end
    end
  end

end
