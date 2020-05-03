class ProductsController < ApplicationController
  def index
    @categories = Category.all
    if params["category_id"] == "1"
      @products = Product.where(category_id:params["category_id"])
    elsif params["category_id"] == "2"
      @products = Product.where(category_id:params["category_id"])
    elsif params["category_id"] == "3"
      @products = Product.where(category_id:params["category_id"])
    elsif params["category_id"] == "4"
      @products = Product.where(category_id:params["category_id"])
    else
      @products = Product.all
    end
  end

  def show
  end
end
