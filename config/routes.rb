Rails.application.routes.draw do
  
  
  
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :addresses,only:[:index,:edit]
    resources :orders,only:[:index,:show]
    get 'orders/new'
    get 'orders/complete'
    resources :cart_items,only:[:index]
    get 'customers/mypage' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customer_information' => 'customer#update'
    get 'customers/unsubscribe'
    patch 'customers/withdrawal'
    resources :items,only:[:index,:show]
  end
  devise_for :admin,controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    
    root to: 'homes#top'
    resources :orders,only:[:show,:update]
    resources :customers,only:[:index,:show,:edit,:update]
    resources :genres,only:[:index,:edit,:create,:update]
    resources :items,only:[:index,:new,:show,:edit,:create,:update]
    
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  
  devise_for :customers,controllers:{
    registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  
end
