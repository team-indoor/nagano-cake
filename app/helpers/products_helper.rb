module ProductsHelper

  def display_name(id)
    if id.nil?
      return "商品一覧"
    else
      category = Category.find(id)
      return "#{category.name}一覧"
    end
  end

  def tax_included_price(price)
    tax = price * 0.1
    total_price = price + tax
    return total_price.floor
  end

end
