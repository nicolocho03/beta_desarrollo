Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root 'pages#home'

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
      patch 'send_to_sst'
      patch 'send_to_compras'
    end
    collection do
      get 'compras'
      get 'sst'
      get 'gerencia'
      get 'contabilidad'
      get 'search'
    end
  end

  resources :specific_states
  resources :general_states
  resources :ubications
  
  get "up" => "rails/health#show", as: :rails_health_check
end



