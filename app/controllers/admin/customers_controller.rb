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
end

def update
end


end
