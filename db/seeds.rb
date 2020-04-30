# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.creart!(
  name:"管理者１",
  email:"admin@mail.com",
  password:"admin1",
  password_confirmation:"admin1"
)

Category.create!{
  [{name: "ケーキ"},{name: "プリン"},{name:,"焼き菓子"},{name:,"ゼリー"}]
}
