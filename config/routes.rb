Rails.application.routes.draw do
  resources :collections
  resources :wishlists
  resources :funkos
  resources :offers

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create]
    end
  end

  get "/searchquery", to: "funkos#search"
  get "/category", to: "funkos#category"
  get "/all-funkos-to-trade", to:"collections#all_funkos_available_to_trade"
  get "/my-funkos-to-trade", to:"collections#my_funkos_to_trade"
  get "funkos-to-trade", to:"collections#funkos_available_to_trade"
  get "my-offers", to:"offers#my_offers"

  post "/auth/create", to: "auth#create"
  get "/auth/show", to: "auth#show"

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
