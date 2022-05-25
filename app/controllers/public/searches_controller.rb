class Public::SearchesController < ApplicationController

  def search
    @search = params[:search]
    @items = Item.looks(params[:search], params[:word])
    @item = @items.page(params[:page])
  end
end
