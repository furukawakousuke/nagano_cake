Rails.application.routes.draw do
  
  namespace :public do
    get 'homes/top'
    get 'homes/about'
    resources :addresses,only:[:index,:edit]
    resources :orders,only:[:index,:show]
    get 'orders/new'
    get 'orders/complete'
    resources :cart_items,only:[:index]
    resources :customers,only:[:show,:edit]
    get 'customers/unsubscribe'
    resources :items,only:[:index,:show]
    resources 
  end
  devise_for :admins
  namespace :admin do
    get 'homes/new'
    resources :orders,only:[:show]
    resources :customers,only:[:index,:show,:edit]
    resources :genres,only:[:index,:edit]
    resources :items,only:[:index,:new,:show,:edit]
    
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  
  devise_for :customers
  
end
