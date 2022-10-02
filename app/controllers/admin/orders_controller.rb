class Admin::OrdersController < ApplicationController
  def show
    @order_detail = OrderDetail.find(params[:id])
    @order = Order.find(params[:id])
    @order_details = OrderDetail.all
  end
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order.id)
  end

end

private

def order_params
  params.require(:order).permit(:customer_id,:status)
end