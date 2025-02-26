class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
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
