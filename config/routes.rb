Rails.application.routes.draw do
  resources :bills do
    member do
      get 'edit_compras'
      patch 'update_compras'
      get 'edit_sst'
      patch 'update_sst'
      get 'edit_compras_segunda_entrega'
      patch 'update_compras_segunda_entrega'
      get 'edit_gerencia'
      patch 'update_gerencia'
      get 'edit_contabilidad'
      patch 'update_contabilidad'
    end
  end
  resources :specific_states
  resources :general_states
  resources :ubications

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  root 'sessions#new'
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
