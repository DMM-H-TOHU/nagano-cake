class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:index, :show]

  def index
    @items = Item.page(params[:page])
    @genres = Genre.all
    @cart_item = CartItem
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  private
  def item_params
    params.require(:items).permit(:genre_id, :name, :introduction, :image_id, :price)
  end

end
