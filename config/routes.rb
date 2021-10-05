Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :customers, controllers: {omniauth_callbacks: "customers/omniauth_callbacks"}
  resources :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'customers#index'

  

end
