class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    flash[:notice] = "会員情報編集処理を実行しました"
    redirect_to public_customers_my_page_path
  end

  def is_deleted
  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to public_path
  end

  private

  def customer_params
    params.require(:customer).permit(:familly_name, :first_name, :familly_name_kana, :first_name_kana,
    :zipcode, :address, :telephone_number, :email)
  end
end
