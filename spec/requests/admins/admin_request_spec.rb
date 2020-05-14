require 'rails_helper'

RSpec.describe "Admins", type: :request do
  include Devise::Test::IntegrationHelpers

  let(:admin){Admin.create(id: 1, name: "管理者１", email: "admin@mail.com", password: "admin1", password_confirmation: "admin1")}
  let(:member){Member.create(id: 1, last_name: "田中", first_name: "太郎", kana_last_name: "タナカ", email: "kkk@mail.com",
              password: "password", password_confirmation: "password", postal_code: "1234567",
              address:"東京都新宿区", phone_number:"08012345678", is_active: true)}
  let(:category){Category.create(id: 1, name: "ケーキ", is_active: true)}
  let(:product){Product.create(id: 1, name:"ケーキ", price:500, category_id: 1, introduction: "説明文が入ります", is_saling: true)}
  # let(:order){Order.create(id: 1, member_id: 1, total_price: 1500, postage: 800, payment: 1, reciever: "田中", postal_code: "1234567", address: "東京", order_status: 0)}
  let(:address){Address.create(id: 1, member_id: 1, postal_code: "1234567", address: "東京", reciever: "田中")}
  let(:cart_item){CartItem.create(id: 1, member_id: 1, product_id: 1, amount: 4)}

  describe "管理者ログインしていない状態で各ページにいけないことを確認" do
    context "管理者ログイン状態でない場合、ログイン画面に遷移" do
      it "トップページ" do
        get admins_path
        expect(response).to redirect_to new_admin_session_path
      end
      it "会員一覧画面" do
        get admins_members_path
        expect(response).to redirect_to new_admin_session_path
      end
      it "会員詳細画面" do
        get admins_member_path(member)
        expect(response).to redirect_to new_admin_session_path
      end
      it "会員編集画面" do
        get edit_admins_member_path(member)
        expect(response).to redirect_to new_admin_session_path
      end
      it "商品一覧画面" do
        get admins_products_path
        expect(response).to redirect_to new_admin_session_path
      end
      it "商品詳細画面" do
        get admins_product_path(product)
        expect(response).to redirect_to new_admin_session_path
      end
      it "商品新規登録画面" do
        get new_admins_product_path
        expect(response).to redirect_to new_admin_session_path
      end
      it "商品編集画面" do
        get edit_admins_product_path(product)
        expect(response).to redirect_to new_admin_session_path
      end
      it "注文一覧画面" do
        get admins_orders_path
        expect(response).to redirect_to new_admin_session_path
      end
      it "ジャンル一覧画面" do
        get admins_categories_path
        expect(response).to redirect_to new_admin_session_path
      end
      it "ジャンル編集画面" do
        get edit_admins_category_path(category)
        expect(response).to redirect_to new_admin_session_path
      end
    end
  end
end
