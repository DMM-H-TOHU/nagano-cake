class Public::SendAddressesController < ApplicationController

  def index
    @send_address = SendAddress.new
    @send_address.customer_id = current_customer.id

  end

  def edit

  end

  def create

  end

  def update

  end

  def destroy

  end

end
