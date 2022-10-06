class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)
    @address = @customer.addresses
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_items = current_customer.cart_items

    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.amount = cart_item.amount
      @order_detail.price = cart_item.item.with_tax_price
      @order_detail.order_id = @order.id
      @order_detail.item_id = cart_item.item_id
      @order_detail.save
    end
    @cart_items.destroy_all
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
    @orders = Order.all
    @orders = current_customer.orders

  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:postal_code,:address,:name,:shipping_cost,:total_payment,:payment_method,:status)

  end



end
