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
    redirect_to orders_complete_path
     
    
  end

  def confirm
     @total = 0
    @orders = CartItem.all
    @order = Order.new(order_params)
    if params[:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
      
    elsif params[:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else
     @order = Order.new(order_params)
    end
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
