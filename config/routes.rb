Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  constraints(subdomain: [ "", "www" ]) do
    root to: "marketing#index"
    get "/pricing", to: "marketing#pricing"
    get "/faq", to: "marketing#faq"
  end

  constraints subdomain: "app" do
    get "signin", to: "sessions#new"
    post "signin", to: "sessions#create"
    delete "signout", to: "sessions#destroy"

    get "signup", to: "users#new"
    post "signup", to: "users#create"

    get "checkout", to: "checkouts#new"
    
    resource :password_resets, only: %i[ new create edit update ]

    namespace :checkouts do
      post "webhooks", to: "webhooks#create"
    end

    patch "active_label", to: "active_labels#update"

    resources :trips do
      resources :days
      resources :transportations
      resources :activities
      resources :lodgings
      resources :sometimes, except: %i[ show edit destroy ]
      resources :summaries, module: "trips", only: [ :index ]
      resources :shares, module: "trips", only: [ :new ]
      resource :notes, module: "trips", only: [ :show ]
    end
    
    namespace "share" do
      resources :trips, only: %i[ show ] do
        resources :days, :transportations, :lodgings, :sometimes, :summaries, only: %i[ index show ]
      end
    end
    
    # Defines the root path route ("/")
    get "/", to: "trips#index"
  end

  get "/404", to: "errors#not_found"
  get "/500", to: "errors#server_error"
  get "/422", to: "errors#unprocessable"
end
