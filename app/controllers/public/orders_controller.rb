class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = Customer.all
  end

  def index
  end

  def show
  end

  def complete
  end

  def comfirm
  end
end
