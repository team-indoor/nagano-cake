require 'rails_helper'

RSpec.describe CartItem, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe "カートアイテムの登録" do
    context "有効なカートアイテム" do
      it "通常のカート追加" do
        member = create(:member)
        product = create(:product)
        cart_item = build(:cart_item)
        cart_item.member_id = member.id
        cart_item.product_id = product.id
        cart_item.save
        expect(cart_item).to be_valid
      end
    end
    context "無効なカートアイテム" do
      it "退会済みのユーザーのカート追加" do
        member = build(:member)
        member.is_active = false
        member.save
        product = create(:product)
        cart_item = build(:cart_item)
        cart_item.member_id = member.id
        cart_item.product_id = product.id
        cart_item.save
        expect(cart_item).to_not be_valid
      end
      it "個数を選択していない商品のカート追加" do
        member = create(:member)
        product = create(:product)
        cart_item = build(:cart_item)
        cart_item.member_id = member.id
        cart_item.product_id = product.id
        cart_item.amount = " "
        cart_item.save
        expect(cart_item).to_not be_valid
      end
      it "すでにカートに入っているアイテムの重複" do
        member = create(:member)
        product = create(:product)
        cart_item = build(:cart_item)
        cart_item.member_id = member.id
        cart_item.product_id = product.id
        dup_cart_item = cart_item.dup
        cart_item.save
        expect(dup_cart_item).to_not be_valid
        dup_cart_item.save
        expect(dup_cart_item).to_not be_valid
      end
      it "販売停止中の商品の追加" do
        member = create(:member)
        product = build(:product)
        product.is_saling = false
        product.save
        cart_item = build(:cart_item)
        cart_item.member_id = member.id
        cart_item.product_id = product.id
        cart_item.save
        expect(cart_item).to_not be_valid
      end
      it "カテゴリーが無効になっている商品の追加" do
        member = create(:member)
        category = Category.create(name: "ケーキ", is_active: false)
        product = build(:product)
        product.category_id = category.id
        product.save
        cart_item = build(:cart_item)
        cart_item.member_id = member.id
        cart_item.product_id = product.id
        cart_item.save
        expect(cart_item).to_not be_valid
      end
    end
  end

end
