class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
   # @genre = Genre.find_by(params[:id])
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
     @item.save
      redirect_to admin_item_path(@item.id)
    #else
      #render "new"
    #end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_status)
  end
end
