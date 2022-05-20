class Admin::HomesController < ApplicationController

  def top
    orders = Order.all
    order_details = OrderDetails.all
    # それぞれの複数インスタンスを1つの配列にする
    @history = orders | order_details
    # 作成降順（新しい順）に並び替え
    @history.soft! {|a, b| b.created_at <=> a.created_at }
    # 作成昇順の場合は、a.created_at <=> b.created_at }
  end

end
