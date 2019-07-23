Rails.application.routes.draw do
  resources :collections
  resources :wishlists
  resources :funkos

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create]
    end
  end

  get "/searchquery", to: "funkos#search"

  post "/auth/create", to: "auth#create"
  get "/auth/show", to: "auth#show"

  get "/collections", to: "collection#my_collection"
  get "/wishlists", to: "wishlist#my_wishlist"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
