# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  name:"管理者１",
  email:"admin@mail.com",
  password:"admin1",
  password_confirmation:"admin1"
)

Category.create!(
  [{name: "ケーキ",is_active: true},{name: "プリン",is_active: true},{name: "焼き菓子",is_active: true},{name: "ゼリー",is_active: true}]
)

# member #

Member.create!(
  [
    {
      last_name: "神谷",
      first_name: "敏生",
      kana_last_name: "カミヤ",
      kana_first_name: "トシキ",
      email: "test1@mail.com",
      password: "test1111",
      password_confirmation: "test1111",
      phone_number: "08011111111",
      postal_code: "1235678",
      address: "東京都新宿区西新宿３丁目",
      is_active: true
    },
    {
      last_name: "岡田",
      first_name: "黎",
      kana_last_name: "オカダ",
      kana_first_name: "レイ",
      email: "test2@mail.com",
      password: "test2222",
      password_confirmation: "test2222",
      phone_number: "08022222222",
      postal_code: "1235678",
      address: "東京都新宿区西新宿３丁目",
      is_active: true
    },
    {
      last_name: "小林",
      first_name: "孝明",
      kana_last_name: "コバヤシ",
      kana_first_name: "タカアキ",
      email: "test3@mail.com",
      password: "test3333",
      password_confirmation: "test3333",
      phone_number: "08033333333",
      postal_code: "1235678",
      address: "東京都新宿区西新宿３丁目",
      is_active: true
    },
    {
      last_name: "小林",
      first_name: "孝",
      kana_last_name: "コバヤシ",
      kana_first_name: "タカシ",
      email: "test4@mail.com",
      password: "test4444",
      password_confirmation: "test4444",
      phone_number: "08044444444",
      postal_code: "1235678",
      address: "東京都新宿区西新宿３丁目",
      is_active: true
    },
    {
      last_name: "小林",
      first_name: "孝明",
      kana_last_name: "コバヤシ",
      kana_first_name: "タカアキ",
      email: "test5@mail.com",
      password: "test5555",
      password_confirmation: "test5555",
      phone_number: "08055555555",
      postal_code: "1235678",
      address: "東京都新宿区西新宿３丁目",
      is_active: true
    },
    {
      last_name: "小林",
      first_name: "孝明",
      kana_last_name: "コバヤシ",
      kana_first_name: "タカアキ",
      email: "test6@mail.com",
      password: "test6666",
      password_confirmation: "test6666",
      phone_number: "08066666666",
      postal_code: "1235678",
      address: "東京都新宿区西新宿３丁目",
      is_active: true
    },
    {
      last_name: "小林",
      first_name: "孝明",
      kana_last_name: "コバヤシ",
      kana_first_name: "タカアキ",
      email: "test7@mail.com",
      password: "test7777",
      password_confirmation: "test7777",
      phone_number: "08077777777",
      postal_code: "1235678",
      address: "東京都新宿区西新宿３丁目",
      is_active: true
    },
    {
      last_name: "小林",
      first_name: "孝明",
      kana_last_name: "コバヤシ",
      kana_first_name: "タカアキ",
      email: "test8@mail.com",
      password: "test8888",
      password_confirmation: "test8888",
      phone_number: "08088888888",
      postal_code: "1235678",
      address: "東京都新宿区西新宿３丁目",
      is_active: true
    },
    {
      last_name: "小林",
      first_name: "孝明",
      kana_last_name: "コバヤシ",
      kana_first_name: "タカアキ",
      email: "test9@mail.com",
      password: "test9999",
      password_confirmation: "test9999",
      phone_number: "08099999999",
      postal_code: "1235678",
      address: "東京都新宿区西新宿３丁目",
      is_active: true
    },
    {
      last_name: "小林",
      first_name: "孝明",
      kana_last_name: "コバヤシ",
      kana_first_name: "タカアキ",
      email: "test10@mail.com",
      password: "test0000",
      password_confirmation: "test0000",
      phone_number: "08033333333",
      postal_code: "1235678",
      address: "東京都新宿区西新宿３丁目",
      is_active: true
    },
    {
      last_name: "小林",
      first_name: "孝明",
      kana_last_name: "コバヤシ",
      kana_first_name: "タカアキ",
      email: "test11@mail.com",
      password: "test11111111",
      password_confirmation: "test11111111",
      phone_number: "08033333333",
      postal_code: "1235678",
      address: "東京都新宿区西新宿３丁目",
      is_active: true
    }
  ]
)

# products #

Product.create!(
  [
    {name:"苺のケーキ",price: 800, is_saling: true, category_id: 1, introduction:"説明文"},
    {name:"チョコレートケーキ",price: 550, is_saling: true, category_id: 1, introduction:"説明文"},
    {name:"プリン",price: 400, is_saling: true, category_id: 2, introduction:"説明文"},
    {name:"ココアプリン",price: 400, is_saling: true, category_id: 2, introduction:"説明文"},
    {name:"クッキー（５枚）",price: 250, is_saling: true, category_id: 3, introduction:"説明文"},
    {name:"マカロン",price: 400, is_saling: true, category_id: 3, introduction:"説明文"},
    {name:"あじさいゼリー",price: 700, is_saling: true, category_id: 4, introduction:"説明文"},
    {name:"しゅわ！ソーダゼリー",price: 600, is_saling: true, category_id: 4, introduction:"説明文"}
  ]
)

