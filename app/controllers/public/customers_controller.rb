class Public::CustomersController < ApplicationController
    before_action :authenticate_customer!
    before_action :set_customer, only: [:show, :edit, :update, :confirm, :deactivate]
    def new
    end

    def create
    end

    def show
      @customer = Customer.find(current_customer.id)
    end
  
    def edit
    end
  
    def update
      if @customer.update(customer_params)
        redirect_to mypage_path, notice: '情報を更新しました。'
      else
        render :edit
      end
    end
  
    def confirm
      # 退会確認ページの表示
    end
  
    def deactivate
      @customer.update(is_active: false)
      sign_out @customer  # 強制ログアウト
      redirect_to root_path, notice: '退会処理が完了しました。'
    end
  
    private
  
    def set_customer
      @customer = current_customer
    end
  
    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email, :password, :password_confirmation)
    end
  end
  