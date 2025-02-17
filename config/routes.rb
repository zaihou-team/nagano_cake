Rails.application.routes.draw do
  scope module: :public do
    devise_for :customers, skip: :password, controllers: {
      registrations: 'public/registrations',
      sessions: 'public/sessions'
    }
    resources :homes, only: [:top, :about ]
    resources :items, only: [:index, :show ]
    resources :addresses, only: [:index, :edit, :create, :destroy, :update ]
    resources :cart_items, only: [:index, :create, :destroy, :update ] do
      collection do
        delete 'destroy_all'
      end
    end

    get 'mypage', to: 'customers#show'
    get 'infomation/edit', to: 'customers#edit'
    patch 'infomation', to: 'customers#update'
    get 'unsubscribe', to: 'customers#unsubscribe'
    patch 'withdraw', to: 'customers#withdraw'
    
    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        get 'confirm'
        get 'thanks'
      end
    end
  end

  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  namespace :admin do
    root to: 'homes#top'
    resources :items, only: [:new, :index, :show, :edit, :create, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end
end
