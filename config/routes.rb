Rails.application.routes.draw do
  namespace :admin do
    namespace :custommers do
      get 'show/show'
    end
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    update 'customers/update'
  end
  namespace :admin do
    get 'items/index'
    get 'items/new'
    post 'items/create'
    get 'items/show'
    get 'items/edit'
    patch 'items/update'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :admin do
    get 'sessions/new'
    post 'sessions/create'
    delete 'sessions/destroy'
  end
  namespace :public do
    get 'orders/new'
    post 'orders/check'
    get 'orders/complete'
    post 'orders/finish'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'cart_items/index'
    patch 'cart_items/update'
    delete 'cart_items/destroy'
    delete 'cart_items/destroy_all'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    patch 'customers/update'
    post 'customers/confirm'
    patch 'customers/update'
  end
  namespace :public do
    get 'sessions/new'
    post 'sessions/create'
    delete 'sessions/destroy'
  end
  namespace :public do
    get 'registrations/new'
    post 'registrations/create'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  devise_for :orders
  devise_for :order_products
  devise_for :cart_items
  devise_for :items
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
