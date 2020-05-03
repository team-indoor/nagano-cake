class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @orders = Order.find(params[:id])
  end

  def new
  end

  def confirmation
  end

  def fixed
  end
end
