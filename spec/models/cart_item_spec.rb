require 'rails_helper'

RSpec.describe CartItem, type: :model do

  describe "カートアイテムの登録" do
    before do
      @member = create(:member)
      @category = create(:category)
      @product = create(:product, category_id: @category.id)
      @cart_item = build(:cart_item, member_id: @member.id, product_id: @product.id)
    end
    context "有効なカートアイテム" do
      it "通常のカート追加" do
        expect(@cart_item).to be_valid
      end
    end
    context "無効なカートアイテム" do
      it "退会済みのユーザーのカート追加" do
        @member.update(is_active: false)
        expect(@cart_item).to_not be_valid
      end
      it "個数を選択していない商品のカート追加" do
        @cart_item.update(amount: " ")
        expect(@cart_item).to_not be_valid
      end
      it "すでにカートに入っているアイテムの重複" do
        dup_cart_item = @cart_item.dup
        @cart_item.save
        expect(@cart_item).to be_valid
        expect(dup_cart_item).to_not be_valid
      end
      it "販売停止中の商品の追加" do
        @product.update(is_saling: false)
        expect(@cart_item).to_not be_valid
      end
      it "カテゴリーが無効になっている商品の追加" do
        @category.update(is_active: false)
        expect(@cart_item).to_not be_valid
      end
    end
  end

end
