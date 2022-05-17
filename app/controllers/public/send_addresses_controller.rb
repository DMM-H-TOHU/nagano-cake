class Public::SendAddressesController < ApplicationController

  def index
    @send_address = SendAddress.new
    @send_address.customer_id = current_customer.id
    @customer = current_customer
    @send_addresses = @customer.send_addresses
  end

  def edit
    @send_address = SendAddress.find(params[:id])
    if @send_address.customer == current_customer
      render :edit
    else
      redirect_to public_send_addresses_path
    end
  end

  def create
    @send_address = SendAddress.new(sendaddress_params)
    @send_address.customer_id = current_customer.id
    if @send_address.save
      redirect_to public_send_addresses_path, notice: "配送先を新規登録しました"
    else
    @customer = current_customer
    @send_addresses = @customer.send_addresses
    @send_address = SendAddress.new(sendaddress_params)
      render 'index'
    end
  end

  def update
    @send_address = SendAddress.find(params[:id])
    if @send_address.update(sendaddress_params)
      redirect_to public_send_addresses_path, notice: "配送先を更新しました"
    else
      @send_address = SendAddress.find(params[:id])
      render "edit"
    end
  end

  def destroy
    @send_address = SendAddress.find(params[:id])
    @send_address.destroy
    redirect_to public_send_addresses_path, notice: "配送先を削除しました"
  end

  private

  def sendaddress_params
    params.require(:send_address).permit(:zipcode, :address, :name)
  end

end
