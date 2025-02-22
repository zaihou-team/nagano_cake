class Public::OrdersController < ApplicationController
    before_action :authenticate_customer!
  
    def new
      @order = Order.new
      @addresses = current_customer.addresses
    end
  
    def confirm
      @order = Order.new(order_params)
      @cart_items = current_customer.cart_items
      @total_price = @cart_items.sum { |ci| ci.item.price * ci.amount }
  
      case params[:order][:select_address].to_i
      when 0
        @order.postal_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.name = current_customer.full_name
      when 1
        address = Address.find(params[:order][:address_id])
        @order.postal_code = address.postal_code
        @order.address = address.address
        @order.name = address.name
      end
    end
  
    def thanks
    end
  
    def create
      @order = current_customer.orders.new(order_params)
      @order.status = 0
      @order.save
  
      current_customer.cart_items.each do |cart_item|
        OrderDetail.create!(
          order: @order,
          item_id: cart_item.item_id,
          amount: cart_item.amount,
          price: cart_item.item.price
        )
      end
  
      current_customer.cart_items.destroy_all
      redirect_to thanks_orders_path
    end
  
    def index
        @orders = current_customer.orders.order(created_at: :desc)
        if params[:search].present?
          @orders = @orders.joins(:order_items).where("items.name LIKE ?", "%#{params[:search]}%")
        end
      end
      
  
    def show
      @order = current_customer.orders.find(params[:id])
      @order_items = @order.order_items
    end
  
    private
  
    def order_params
      params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shopping_cost, :total_payment)
    end

    def set_default_payment_method
      self.payment_method ||= "credit_card"
    end
  end