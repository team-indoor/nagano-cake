module Admins::OrdersHelper

  def all_amount_count(counts)
    all_count = 0
    counts.each do |count|
      all_count = all_count + count.amount
    end
    all_count
  end

end
