Rails.application.routes.draw do
  
  
  namespace :admin do
    resources :orders,only:[:show]
    resources :customers,only:[:index,:show,:edit]
    resources :genres,only:[:index,:edit]
    resources :items,only:[:index,:new,:show,:edit]
    
  end
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  
  devise_for :customers
  
end
