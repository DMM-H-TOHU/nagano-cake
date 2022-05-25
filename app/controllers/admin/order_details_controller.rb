class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  def update
    @order_detail = OrderDetail.find(params[:order_detail][:id])
    @order = @order_detail.order
    @order_detail.update(order_detail_params)
    @order_details = @order.order_details

    if @order_detail.making_status == "making"
      @order.order_status = "making"
      @order.save
    end

    decide = 0

    @order_details.each do |order_detail|
      if order_detail.making_status != "complete"
        decide += 1
      end
    end

    if decide == 0
      @order.order_status = "preparing"
      @order.save
    end

      redirect_to admin_order_path(@order)
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
