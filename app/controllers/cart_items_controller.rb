class CartItemsController < ApplicationController
  include CartItemsHelper
  before_action :authenticate_member!
  before_action :active_member?

  def index
    @cart_item = CartItem.new
    @cart_items = CartItem.where(member_id: current_member.id)
    @total_price = 0
    @cart_items.each do |cart_item|
      @total_price += cart_item.amount * tax_included_price(cart_item.product.price)
    end
  end

  def create
      @cart_item = CartItem.new(
      member_id: current_member.id,
      product_id: params[:product_id],
      amount: params[:count]
      )
      if @cart_item.save
        redirect_to member_cart_items_path
      else
        @cart_items = CartItem.where(member_id: current_member.id)
        @total_price = 0
        @cart_items.each do |cart_item|
          @total_price += cart_item.amount * tax_included_price(cart_item.product.price)
        end
        render "index"
      end
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to member_cart_items_path
  end


  def destroy_all
    cart_items = CartItem.where(member_id: current_member.id)
    cart_items.destroy_all
    redirect_to member_cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to member_cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(
    :member_id,
    :product_id,
    :amount,
  )
  end
end