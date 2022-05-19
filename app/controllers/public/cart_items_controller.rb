class Public::CartItemsController < ApplicationController

  def index
    @total_price = CartItem.total_price
    @items = CartItem.items
  end
  
  def create
    if 
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
