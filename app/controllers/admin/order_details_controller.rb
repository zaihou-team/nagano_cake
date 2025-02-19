class Admin::OrderDetailsController < ApplicationController

  def update
    order_detail = OrderDetail.find(params[:id])
    if order_detail.update(order_detail_params)
      if order_detail.making_status == 'in_production'
        order_detail.order.update(status: 'in_production')
        redirect_to admin_order_path(order_detail.order.id)
      elsif order_detail.making_status == 'production_completed'
        a = true
        order_detail.order.order_details.each do |order_detail| 
          if order_detail.making_status != 'production_completed'
            a = false
          end
        end
        if a
          order_detail.order.update(status: 'preparing_for_shipment')
          redirect_to admin_order_path(order_detail.order.id)
        end

      end
    end
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
