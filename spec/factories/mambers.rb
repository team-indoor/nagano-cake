FactoryBot.define do

  factory :member do
    last_name             {"てすと"}
    first_name            {"太郎"}
    kana_last_name        {"テスト"}
    kana_first_name       {"タロウ"}
    email                 {"kkk@mail.com"}
    password              {"password"}
    password_confirmation {"password"}
    postal_code           {"1111111"}
    address               {"東京都新宿区"}
    phone_number          {"08000000000"}
  end

end