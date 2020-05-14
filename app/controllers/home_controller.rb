class HomeController < ApplicationController
  def top
    @categories = Category.where(is_active: true)
    @products = Product.where(is_saling: true)
  end
end
