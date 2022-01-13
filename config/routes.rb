Rails.application.routes.draw do
  get 'dashboard/home'
  get 'pages/home'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  authenticated do
   root :to => 'dashboard#home',  as: :authenticated_root
  end
  
  
  unauthenticated :user do
    root to: 'pages#home', as: :unauthenticated_root
  end
  
  
end
