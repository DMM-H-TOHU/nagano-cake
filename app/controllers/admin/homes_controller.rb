class Admin::HomesController < ApplicationController

  def top
    @order = Order.all
    @order_details = OrderDetail.all
    @order_sorts = Order.all.order(created_at: :desc)
  end

end
