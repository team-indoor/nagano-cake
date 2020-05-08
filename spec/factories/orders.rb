FactoryBot.define do
  factory :order do
    member_id     {}
    total_price   {}
    postage       {800}
    payment       {1}
    reciever      {"田中太郎"}
    postal_code   {"1234567"}
    address       {"東京都新宿区"}
    order_status  {0}
  end
end
