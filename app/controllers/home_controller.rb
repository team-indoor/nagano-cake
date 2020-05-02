class HomeController < ApplicationController
  def top
    @categories = Category.all
    @products = Product.all
  end
end
