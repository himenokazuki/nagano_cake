Rails.application.routes.draw do
  # new,index,edit,update,show,destroy,create

  #items routing(resources)
  # index,create -> ~/items
  # new -> ~/items/new
  # show,update,destroy -> ~/item/:id
  # edit -> ~/item/:id/edit

  root to: 'public/homes#top'
  get '/about'=>'public/homes#about'
  #get '/customers/sign_up'=>'customers#new'
  #resources :registrations,only:[:create]
  #delete '/customers/sign_out'=>'cusutomers#destroy'

  namespace :admin do

    resources :items
    resources :customers,except:[:new,:create,:destroy]
    resources :orders,only:[:show]
    get 'homes/top'

    delete '/admin/sign_out'=>'sessions#destoroy'
  end
   scope module: :public do
   get '/cart_items/destroy_all'=>'cart_items#destroy_all'

   get '/customers'=>'customers#show'
   get '/customers/edit'=>'customers#edit'
   patch '/cutomers/introduction'=>'cutomers#update'
   get '/customers/confirm'=>'customers#confirm'
   get '/customers/withdrawal'=>'customers#withdrawal'

   resources :cart_items,except:[:new,:show,:edit]
   resources :orders,except:[:edit,:update,:destroy]
   resources :items,only:[:show,:index]
   
   post '/orders/check'=>'orders#check'
   get '/orders/complete'=>'orders#complete'
  end

  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
