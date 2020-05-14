require 'rails_helper'

RSpec.describe "Members", type: :request do

  let(:admin){Admin.create(id: 1, name: "管理者１", email: "admin@mail.com", password: "admin1", password_confirmation: "admin1")}
  let(:member){Member.create(id: 1, last_name: "田中", first_name: "太郎", kana_last_name: "タナカ", email: "kkk@mail.com",
              password: "password", password_confirmation: "password", postal_code: "1234567",
              address:"東京都新宿区", phone_number:"08012345678", is_active: true)}
  let(:category){Category.create(id: 1, name: "ケーキ", is_active: true)}
  let(:product){Product.create(id: 1, name:"ケーキ", price:500, category_id: 1, introduction: "説明文が入ります", is_saling: true)}
  let(:order){Order.create!(id: 1, member_id: 1, total_price: 1500, postage: 800, payment: 1, reciever: "田中", postal_code: "1234567", address: "東京", order_status: 0)}
  let(:address){Address.create(id: 1, member_id: 1, postal_code: "1234567", address: "東京", reciever: "田中")}
  let(:cart_item){CartItem.create(id: 1, member_id: 1, product_id: 1, amount: 4)}

  describe "会員ログインしていない状態での各ページ表示の確認" do
    context "ログインしていない状態でも閲覧できる画面のテスト" do
      it "トップページ" do
        get root_path
        expect(response.status).to eq(200)
      end
      it "商品一覧画面" do
        get products_path
        expect(response.status).to eq(200)
      end
      it "商品詳細画面" do
        get product_path(product)
        expect(response.status).to eq(200)
      end
    end
    context "ログインしていない状態では閲覧できない画面のテスト" do
      it "マイページ" do
        get member_path(member)
        expect(response).to redirect_to new_member_session_path
      end
      it "会員編集画面" do
        get edit_member_path(member)
        expect(response).to redirect_to new_member_session_path
      end
      it "カート画面" do
        get member_cart_items_path(member.id)
        expect(response).to redirect_to new_member_session_path
      end
      it "注文履歴一覧画面" do
        get member_orders_path(member.id)
        expect(response).to redirect_to new_member_session_path
      end
      it "注文情報登録画面" do
        get new_member_order_path(member.id)
        expect(response).to redirect_to new_member_session_path
      end
      it "配送先一覧画面" do
        get member_addresses_path(member.id)
        expect(response).to redirect_to new_member_session_path
      end
      it "配送先編集画面" do
        get edit_member_address_path(member.id,address.id)
        expect(response).to redirect_to new_member_session_path
      end

    end
  end

end
