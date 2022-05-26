class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.order_status == "confirm"
      @order_details = @order.order_details
      @order_details.each do |order_detail|
        order_detail.making_status = "waiting"
        order_detail.save
      end
    end
      redirect_to admin_order_path(@order)
  end

  private
  def order_params
    params.require(:order).permit(:order_status)
  end

end
