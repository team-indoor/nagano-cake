class Admins::ProductsController < ApplicationController
  before_action :authenticate_admin!

  def index
    if params[:search].nil?
      @products = Product.all.page(params[:page]).per(50)
    elsif params[:search].blank?
      @products = Product.all.page(params[:page]).per(50)
    else
      @products = Product.where("name like?", "%#{params[:search]}%" ).page(params[:page]).per(50)
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product =  Product.new(product_params)
    if @product.save
      unless @product.category.is_active?
        @product.update(is_saling: false)
      end
      redirect_to admins_product_path(@product)
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      if @product.category.is_active?
        redirect_to admins_product_path(@product)
      else
        if @product.is_saling?
          @product.update(is_saling: false)
          redirect_to admins_product_path(@product)
        end
      end
    else
      render :edit
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :image, :category_id, :introduction, :is_saling)
  end
end
