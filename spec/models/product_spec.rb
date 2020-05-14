require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = build(:product)
  end
  describe "商品全般" do
    context "必要な部分だけ入力" do
      it "Image以外は必須項目" do
        expect(@product).to be_valid
      end
    end
  end

  describe "商品名" do
    context "無効な商品名" do
      it "空白" do
        @product.name = " "
        expect(@product).to_not be_valid
      end
    end
  end

  describe "商品価格" do
    context "無効な商品価格" do
      it "空白" do
        @product.price = " "
        expect(@product).to_not be_valid
      end
    end
  end

  describe "商品紹介文" do
    context "無効な商品紹介文" do
      it "200文字を超える文章" do
        @product.introduction = "a" * 201
        expect(@product).to_not be_valid
      end
    end
  end

end
