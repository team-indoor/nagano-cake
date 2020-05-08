require 'rails_helper'

RSpec.describe Product, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe "商品全般" do
    context "必要な部分だけ入力" do
      it "Image以外は必須項目" do
        product = build(:product)
        product.save
        expect(product).to be_valid
      end
    end
  end

  describe "商品名" do
    context "無効な商品名" do
      it "空白" do
        product = build(:product)
        product.name = " "
        product.save
        expect(product).to_not be_valid
      end
    end
  end

  describe "商品価格" do
    context "無効な商品価格" do
      it "空白" do
        product = build(:product)
        product.price = " "
        product.save
        expect(product).to_not be_valid
      end
      it "0円" do
        product = build(:product)
        product.price = "0"
        product.save
        expect(product).to_not be_valid
      end
      it "数値以外" do
        product = build(:product)
        product.price = "百円"
        product.save
        expect(product).to_not be_valid
      end
    end
  end

  describe "商品紹介文" do
    context "無効な商品紹介文" do
      it "200文字を超える文章" do
        product = build(:product)
        product.introduction = "a" * 201
        product.save
        expect(product).to_not be_valid
      end
    end
  end

end
