Rails.application.routes.draw do
  namespace :api do
    resources :rsvps, only: [:create, :update, :destroy]
    resources :memberships, only: [:create, :destroy]
    resources :events
    resources :groups, only: [:index, :show, :create]
    resources :users
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    get "/me", to: "users#show"
    post "/signup", to: "users#create"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
  end

  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }

end
