class Admins::ProductsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @products = Product.all.page(params[:page]).per(50)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product =  Product.new(product_params)
    unless @product.category.is_active?
      @product.update(is_saling: false)
    end
    if @product.save
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
