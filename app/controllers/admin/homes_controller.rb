class Admin::HomesController < ApplicationController
  
  def top
    @histories = History.all.page(params[:page]).per(10)
    @order = Order.all
  end
  
end
