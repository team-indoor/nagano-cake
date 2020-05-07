class CartItemsController < ApplicationController
  include CartItemsHelper
  before_action :authenticate_member!

  def index
    @cart_items = CartItem.where(member_id: current_member.id)
    @total_price = 0
    @cart_items.each do |cart_item|
      @total_price += cart_item.amount * tax_included_price(cart_item.product.price)
    end
  end

  def create
    item = CartItem.where(product_id: params[:product_id], member_id: current_member.id)
    if item.empty?
      cart_items = CartItem.create(
      member_id: current_member.id,
      product_id: params[:product_id],
      amount: params[:count]
      )
      redirect_to member_cart_items_path
    else
      flash[:notice] = "こちらの商品は既にカートに入っています"
      redirect_to member_cart_items_path
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

end
