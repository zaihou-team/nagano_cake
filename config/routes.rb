Rails.application.routes.draw do
  scope module: :public do
    devise_for :customers, controllers: {
      registrations: 'public/customers/registrations',
      sessions: 'public/customers/sessions'
    }
    resources :homes, only: [:top, :about ]
    resources :items, only: [:index, :show ]
    resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdraw ]
    resources :cart_items, only: [:index, :create, :destroy, :destroy_all, :update ]
    resources :orders, only: [:new, :index, :show, :create, :confirm, :thanks ]
    resources :addresses, only: [:index, :edit, :create, :destroy, :update ]
  end
  namespace :admin do
    devise_for :admins, controllers: {
      sessions: 'admin/admins/sessions'
    }
    resources :homes, only: [:top ]
    resources :items, only: [:new, :index, :show, :edit, :create, :update ]
    resources :genres, only: [:index, :edit, :create, :update ]
    resources :customers, only: [:index, :show, :edit, :update ]
    resources :orders, only: [:show, :update ]
    resources :order_details, only: [:update]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
