class Admins::OrdersController < ApplicationController
  PER = 10
  def index
    @orders = Order.page(params[:page]).per(PER)
  end

  def show
    @order = Order.find(params[:id])
    @member = Member.where(id: @order.member_id)
    @order_detail = OrderDetail.where(order_id: params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admins_order_path(@order)
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
