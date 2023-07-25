Rails.application.routes.draw do
  resources :subscriptions, only: [:create, :index, :update]
  resource :subscription, only: [:update]
  resources :customers, only: [:index] do 
        resources :subscriptions 
      end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
