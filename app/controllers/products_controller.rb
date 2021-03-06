class ProductsController < ApplicationController
  def index
    @categories = Category.where(is_active: true)
    if params["category_id"].nil?
      @products = Product.all.page(params[:page]).per(20)
    else
      @products = Product.where(category_id: params["category_id"]).page(params[:page]).per(20)
    end
  end

  def show
    @categories = Category.where(is_active: true)
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
  end
end
