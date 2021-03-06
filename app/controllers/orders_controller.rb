class OrdersController < ApplicationController
  include OrdersHelper
  before_action :authenticate_member!
  before_action :active_member?
  before_action :ensure_correct_member?

  def index
    @orders = Order.where(member_id: current_member.id).order(created_at: "DESC")
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
  end

  def new
    @address = Address.where(member_id: current_member.id)
  end

  def create
    @cart_items = CartItem.where(member_id: current_member.id)
    @order = Order.create(order_params)
    @cart_items.each do |item|
      OrderDetail.create(order_id: @order.id, product_id: item.product_id, price: tax_included_price(item.product.price), amount: item.amount, production_status: 0)
    end
      @cart_items.destroy_all
      redirect_to fixed_member_orders_path
    end

  def confirmation
    @order = Order.new
    if params[:address] == "2"
      Address.create!(postal_code: params[:new_postal_code], address: params[:new_address], reciever: params[:new_reciever], member_id: current_member.id)
    end
    @cart_items = CartItem.where(member_id: current_member.id)
    @address = Address.where(member_id: current_member.id)
    @total_price = 0
    @cart_items.each do |cart_item|
      @total_price += cart_item.amount * tax_included_price(cart_item.product.price)
    end
      render :confirmation
  end

  def fixed
  end

  private
  def order_params
    params.require(:order).permit(
      :member_id,
      :total_price,
      :postage,
      :payment,
      :reciever,
      :postal_code,
      :address,
      :order_status
    )
  end

end