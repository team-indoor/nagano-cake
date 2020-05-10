class Admins::CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    Category.create(category_params)
    redirect_to admins_categories_url
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    category = Category.find(params[:id])
    category.update(category_params)
    unless category.is_active?
      category.products.each do |product|
        product.update(is_saling: false)
      end
    end
    redirect_to admins_categories_url
  end

  private
  def category_params
    params.require(:category).permit(:name, :is_active)
  end
end
