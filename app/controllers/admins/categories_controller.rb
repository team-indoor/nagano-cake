class Admins::CategoriesController < ApplicationController
  before_action :authenticate_admin!
  def index
    if params[:search].nil?
      @categories = Category.all
    elsif params[:search].blank?
      @categories = Category.all
    else
      @categories = Category.where("name like?", "%#{params[:search]}%" )
    end
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admins_categories_url
    else
      @categories = Category.all
      render :index
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      unless @category.is_active?
        @category.products.each do |product|
          product.update(is_saling: false)
        end
        redirect_to admins_categories_path
      end
    else
      @categories = Category.all
      render :edit
    end
    
  end

  private
  def category_params
    params.require(:category).permit(:name, :is_active)
  end
end
