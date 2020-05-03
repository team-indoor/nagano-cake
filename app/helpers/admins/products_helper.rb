module Admins::ProductsHelper

  def tax_included_price(price)
    tax = price * 0.1
    total_price = price + tax
    return total_price.floor
  end

end
