class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.all
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    # もしもともとカート内に「同じ商品」がある場合、「数量を追加」更新・保存する
    # ex)バナナ２個、バナナ２個、ではなく、バナナ「４個」にしたい
    if current_customer.cart_items.find_by(item_id: params[:item_id]).present?
          # 元々カート内にあるもの「item_id」
          # 今追加した　　　　　　　params[:cart_item][:item_id]
      cart_item = current_customer.cart_items.find_by(item_id: params[:item_id])
      cart_item.amount += params[:amount].to_i
      # cart_item.quantityに今追加したparams[:cart_item][:quantity]を加える
      # .to_iとして数字として扱う

      cart_item.save
      redirect_to public_cart_items_path

    elsif @cart_item.save
          @cart_items = current_customer.cart_items.all
          render 'index'
    else
      render 'index'
    end
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(amount: params[:cart_item][:amount].to_i)
      redirect_to public_cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    @cart_items = CartItem.all
      render 'index'
  end

  def destroy_all
    cart_items = CartItem.all
    cart_items.destroy_all
    render 'index'
  end

  private
  def cart_item_params
    params.permit(:item_id, :amount)
  end
end
