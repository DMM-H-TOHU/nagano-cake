class Admin::CustomersController < ApplicationController

def index
  @customers=Customer.all
  @customers=Customer.all.page(params[:page]).per(5)
end

def show
  @customers = Customer.all
  @customer = Customer.find(params[:id])
end

def edit
  @customer = Customer.find(params[:id])
end

def update
  @customer = Customer.find(params[:id])
  @customer.update(customer_params)
  redirect_to admin_customers_path
end


  def customer_params
    params.require(:customer).permit(:familly_name, :first_name, :familly_name_kana, :first_name_kana,
    :zipcode, :address, :telephone_number, :email)
  end

end
