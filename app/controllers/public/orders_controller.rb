class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
    @send_addresses = @customer.send_addresses
  end

  def create # Orderに情報を保存する
    cart_items = current_customer.cart_items.all
    # ログインユーザーのカートアイテムを全て取り出してcart_itemsにいれる
    @order = current_customer.orders.new(order_params)
    # わたってきた値を@orderに入れる
    @orders = Order.all
    if @order.save
    # ここに至るまでの間に確認(confirm)は済ませているが、念のためif文で分岐
      cart_items.each do |cart|
    # 取り出したカートアイテムの数繰り返す
    # order_detailにも一緒にデータを保存する必要があるためここで保存
        order_detail = OrderDetail.new
        order_detail.item_id = cart.item_id
        order_detail.order_id = @order.id
        order_detail.order_amount = cart.amount
    # 購入が完了したらカート情報は削除するためこちらに保存する
        order_detail.order_price = car.item.price
    # カート情報を削除するためitemとの紐づけが切れる前に保存
        order_detail.save
      end
      redirect_to public_orders_confirm_path
      cart_items.destroy_all
    # ユーザーに関連するカートのデータ(購入したデータ)を全て削除する(カートを空にする)
    else
      @order = Order.new(order_params)
      render :new
    end
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

  # new画面から渡ってきたデータをユーザーに確認してもらう
  def confirm
    @order = Order.new(order_params)
    @customer = Customer.find(current_customer.id)
  # new画面から渡ってきたデータを@orderに入れる
    if params[:order][:address_number] == "1"
  # viewで定義しているaddress_number1が"1"だった時にこの処理を実行
  # form_withで@orderで送っているので、orderに紐づいたaddress_numberとなる。以下同様
      @order.name = @customer.familly_name #@orderの各カラムに必要なものを入れる
      @order.address = @customer.address
    elsif params[:order][:address_number] == "2"
  # viewで定義しているaddress_numberが"2"だった時にこの処理を実行する
      if Address.exists?(name: params[:order][:address])
        @order.name = Address.find(params[:order][:address]).name
        @order.address = Address.find(params[:order][:address]).address
      else

      end
    elsif params[:order][:address] == "3"
      address_new = current_customer.addresses.new(address_params)
      if address_new.save
      else

      end
    else

    end
    @cart_items = current_customer.cart_items.all
  end

  private

  def order_params
    params.require(:order).permit(:zipcode, :address, :name)
  end

  def address_params
    params.require(:order).permit(:name, :address)
  end
end
