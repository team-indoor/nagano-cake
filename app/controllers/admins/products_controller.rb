class Admins::ProductsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product =  Product.create!(product_params)
    if @product
      redirect_to admins_product_path(@product)
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    if product.update(product_params)
      redirect_to admins_product_path(product)
    else
      render :edit
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :image, :category_id, :introduction, :is_saling)
  end
end
