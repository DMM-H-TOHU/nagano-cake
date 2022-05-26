class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

def index
  @customers=Customer.all
  @customers=Customer.all.page(params[:page]).per(10)
end

def show
  @customers = Customer.all
  @customer = Customer.find(params[:id])
end

def edit
  @customer = Customer.find(params[:id])
  @customers = Customer.all
end

def update
  @customer = Customer.find(params[:id])
  if @customer.update(customer_params)
    redirect_to admin_customers_path
  else
    @customers = Customer.all
    render "edit"
  end
end



  def customer_params
    params.require(:customer).permit(:familly_name, :first_name, :familly_name_kana, :first_name_kana,
    :zipcode, :address, :telephone_number, :email, :is_deleted)
  end

end
