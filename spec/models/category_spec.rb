require 'rails_helper'

RSpec.describe Category, type: :model do

  describe "カテゴリーの登録" do
    context "有効なカテゴリー" do
      it "入力項目に不備なし" do
        category = create(:category)
        expect(category).to be_valid
      end
    end
    context "無効なカテゴリー" do
      it "カテゴリー名が空欄" do
        category = build(:category, name: " ")
        expect(category).to_not be_valid
      end
    end
  end
end
