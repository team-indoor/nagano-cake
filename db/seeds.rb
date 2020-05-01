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
    }
  ]
)
