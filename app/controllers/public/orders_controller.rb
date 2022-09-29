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
    redirect_to orders_confirm_path
  end

  def confirm
    @total = 0
    @orders = CartItem.all
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
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
