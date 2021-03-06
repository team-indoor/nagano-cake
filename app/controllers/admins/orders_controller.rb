class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!
  PER = 10
  def index
    if params[:search].nil?
      @orders = Order.all.order(created_at: :desc).page(params[:page]).per(PER)
    elsif params[:search].blank?
      @orders = Order.all.order(created_at: :desc).page(params[:page]).per(PER)
    else
      @orders = Order.where("created_at like?", "%#{params[:search]}%" ).order(created_at: :desc).page(params[:page]).per(PER)
    end
    @orders_home = Kaminari.paginate_array(Order.where(created_at: Date.today.beginning_of_day..Date.today.end_of_day).reverse).page(params[:page]).per(PER)
    @orders_member = Kaminari.paginate_array(Order.where(member_id: params[:member_id]).reverse).page(params[:page]).per(PER)
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
