class Admins::HomeController < ApplicationController
  def top
    @orders = Order.where(created_at: Date.today)
    if @orders.nil?
      return @today_count = 0
    else
      @today_count = @orders.length
    end
  end
end
