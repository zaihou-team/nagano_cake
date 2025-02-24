class Public::AddressesController < ApplicationController
    before_action :authenticate_customer!
    before_action :set_address, only: [:edit, :update, :destroy]
  
    def index
      @addresses = current_customer.addresses
      @address = Address.new
    end
  
    def edit
    end
  
    def create
      @address = current_customer.addresses.build(address_params)
      if @address.save
        redirect_to addresses_path, notice: '配送先を追加しました。'
      else
        @addresses = current_customer.addresses
        render :index
      end
    end
  
    def update
      if @address.update(address_params)
        redirect_to addresses_path, notice: '配送先を更新しました。'
      else
        render :edit
      end
    end
  
    def destroy
      @address.destroy
      redirect_to addresses_path, notice: '配送先を削除しました。'
    end
  
    private
  
    def set_address
      @address = current_customer.addresses.find(params[:id])
    end
  
    def address_params
      params.require(:address).permit(:postal_code, :address, :name)
    end
  end