Rails.application.routes.draw do
  resources :subscriptions, only: [:create, :index]
  resource :subscription, only: [:update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
