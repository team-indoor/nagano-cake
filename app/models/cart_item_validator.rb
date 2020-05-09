class CartItemValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    member_id = record.member_id
    new_product_id = record.product_id

    # カレントユーザーの商品が重複しないか検索
    products_not_overlap = CartItem.where(product_id: new_product_id, member_id: member_id)
    record.errors.add(attribute) if products_not_overlap.present?
  end
end