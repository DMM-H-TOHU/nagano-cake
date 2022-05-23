class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
    @send_addresses = @customer.send_addresses
  end

  def create
    @order = Order.new(order_params)
    @order.save
  　redirect_to public_orders_confirm_path
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order=Order.find(params[:id])
    @order_details=@order.order_details
  end

  def complete
  end

  def confirm
  end

  private

  def order_params
    params.require(:order).permit(:zipcode, :address, :name)
  end
end
