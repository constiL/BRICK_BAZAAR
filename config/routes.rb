Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :bricks do
    resources :buy_requests, only: %i[create update] do
      patch :accept
      patch :decline
    end
  end

  resources :buy_requests, only: %i[destroy]

  get "brickfolio", to: "users#show", as: "brickfolio"
end
