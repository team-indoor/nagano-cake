require 'rails_helper'

RSpec.describe Member, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe "会員登録" do
    context "有効な会員の登録" do
      it "全ての項目に入力がないと保存できない" do
        member = build(:member)
        member.save
        expect(member).to be_valid
      end
    end
  end

  describe "苗字の登録" do
    context "有効な苗字" do
      it "漢字" do
        member = build(:member)
        member.last_name = "田中"
        member.save!
        expect(member).to be_valid
      end
      it "平仮名" do
        member = build(:member)
        member.last_name = "たなか"
        member.save!
        expect(member).to be_valid
      end
      it "カタカナ" do
        member = build(:member)
        member.last_name = "タナカ"
        member.save!
        expect(member).to be_valid
      end
      it "ローマ字（英語）で登録" do
        member = build(:member)
        member.last_name = "TANAKA"
        member.save!
        expect(member).to be_valid
      end
    end
    context "無効な苗字" do
      it "空白" do
        member = build(:member)
        member.last_name = " "
        member.save
        expect(member).to_not be_valid
      end
    end
  end

  describe "名前の登録" do
    context "有効な名前" do
      it "漢字" do
        member = build(:member)
        member.first_name = "太郎"
        member.save!
        expect(member).to be_valid
      end
      it "平仮名" do
        member = build(:member)
        member.first_name = "たろう"
        member.save!
        expect(member).to be_valid
      end
      it "カタカナ" do
        member = build(:member)
        member.first_name = "タロウ"
        member.save!
        expect(member).to be_valid
      end
      it "ローマ字（英語）" do
        member = build(:member)
        member.first_name = "TARO"
        member.save!
        expect(member).to be_valid
      end
    end
    context "無効な名前" do
      it "空白" do
        member = build(:member)
        member.first_name = " "
        member.save
        expect(member).to_not be_valid
      end
    end
  end
  describe "会員登録全般" do
    context "有効な会員" do
      it "全ての項目に入力がないと保存できない" do
        member = build(:member)
        member.save
        expect(member).to be_valid
      end
    end
  end

  describe "苗字(カナ)の登録" do
    context "有効な苗字(カナ)" do
      it "カタカナ" do
        member = build(:member)
        member.kana_last_name = "タナカ"
        member.save!
        expect(member).to be_valid
      end
    end
    context "無効な苗字(カナ)" do
      it "空白" do
        member = build(:member)
        member.kana_last_name = " "
        member.save
        expect(member).to_not be_valid
      end
      it "カタカナ以外" do
        member = build(:member)
        member.kana_last_name = "たなか"
        member.save
        expect(member).to_not be_valid
      end
    end
  end

  describe "名前(カナ)の登録" do
    context "有効な名前(カナ)" do
      it "カタカナ" do
        member = build(:member)
        member.kana_last_name = "タロウ"
        member.save!
        expect(member).to be_valid
      end
    end
    context "無効な名前(カナ)" do
      it "空白" do
        member = build(:member)
        member.kana_last_name = " "
        member.save
        expect(member).to_not be_valid
      end
      it "カタカナ以外" do
        member = build(:member)
        member.kana_last_name = "たろう"
        member.save
        expect(member).to_not be_valid
      end
    end
  end

  describe "メールアドレスの登録" do
    context "有効なメールアドレス" do
      it "@が入っている" do
        member = build(:member)
        member.email = "rrr@mail.com"
        member.save
        expect(member).to be_valid
      end
    end

    context "無効なメールアドレス" do
      it "空欄" do
        member = build(:member)
        member.email = " "
        member.save
        expect(member).to_not be_valid
      end
      it "@マークが入っていない" do
        member = build(:member)
        member.email = "rrr mail.com"
        member.save
        expect(member).to_not be_valid
      end
    end
  end

  describe "パスワードの登録" do
    context "passwordとpassword_confirmationの一致" do
      it "一致していない" do
        member = build(:member)
        member.password = "abcdef"
        member.password_confirmation = "ghijkl"
        member.save
        expect(member).to_not be_valid
      end
    end
    context "有効なパスワード" do
      it "6文字以上" do
        member = build(:member)
        member.password = "a" * 6
        member.password_confirmation = "a" * 6
        member.save
        expect(member).to be_valid
      end
      it "大文字と小文字の混合" do
        member = build(:member)
        member.password = "aWFFsddwWW"
        member.password_confirmation = "aWFFsddwWW"
        member.save
        expect(member).to be_valid
      end
    end
    context "無効なパスワード" do
      it "6文字以下" do
        member = build(:member)
        member.password = "a" * 5
        member.password_confirmation = "a" * 5
        member.save
        expect(member).to_not be_valid
      end
      it "空白" do
        member = build(:member)
        member.password = " "
        member.password_confirmation = " "
        member.save
        expect(member).to_not be_valid
      end
    end
  end

  describe "郵便番号の登録" do
    context "有効な郵便番号" do
      it "７桁の数字" do
        member = build(:member)
        member.postal_code = "1234567"
        member.save
        expect(member).to be_valid
      end
    end
    context "無効な郵便番号" do
      it "７桁以外の数字" do
        member = build(:member)
        member.postal_code = "12345678"
        member.save
        expect(member).to_not be_valid
      end
      it "空欄" do
        member = build(:member)
        member.postal_code = " "
        member.save
        expect(member).to_not be_valid
      end
      it "数字以外" do
        member = build(:member)
        member.postal_code = "あいうえおかき"
        member.save
        expect(member).to_not be_valid
      end
    end
  end

  describe "住所" do
    context "無効な住所" do
      it "空欄" do
        member = build(:member)
        member.address = " "
        member.save
        expect(member).to_not be_valid
      end
    end
  end

  describe "電話番号" do
    context "有効な電話番号" do
      it "数字のみ" do
        member = build(:member)
        member.phone_number = "08088888888"
        member.save
        expect(member).to be_valid
      end
    end
    context "無効な電話番号" do
      it "空欄" do
        member = build(:member)
        member.phone_number = " "
        member.save
        expect(member).to_not be_valid
      end
      it "数字以外" do
        member = build(:member)
        member.phone_number = "ゼロ8ゼロ"
        member.save
        expect(member).to_not be_valid
      end
    end
  end

end