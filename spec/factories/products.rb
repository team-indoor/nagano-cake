FactoryBot.define do
  factory :product do
    name          {"苺のケーキ"}
    price         {800}
    is_saling     {true} 
    category_id   {1} 
    introduction  {"説明文"} 
  end
  
end
