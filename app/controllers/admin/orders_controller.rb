class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.all
  end

  def update
    order = Order.find(params[:id])
    if order.update(order_params)
      if order.status == 'payment_confirmed' 
        order.order_details.update_all(making_status: "waiting_for_production")
        redirect_to admin_order_path(order.id)
      elsif
      redirect_to admin_order_path(order.id)
      end
    end
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end
