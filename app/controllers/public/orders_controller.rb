class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
    @address = @customer.addresses
  end
  
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    redirect_to orders_path
  end

  def complete
  end

  def index
  end

  def show
  end
  
  private
  
  def order_params
    params.require(:order).permit(:postal_code,:address,:name,:shipping_cost,:total_payment,:payment_method,:status)
    
  end
  
  
  
end
