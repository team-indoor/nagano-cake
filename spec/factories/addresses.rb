FactoryBot.define do
  factory :address do
    member_id       {1}
    reciever        {"田中太郎"}
    postal_code     {"1234567"}
    address         {"東京都新宿区"}
  end
end
