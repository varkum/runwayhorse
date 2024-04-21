Rails.application.routes.draw do
  
  get "up" => "rails/health#show", as: :rails_health_check
  
  constraints(subdomain:[ "", "www" ]) do
    root to: "marketing#index"
    get "/pricing", to: "marketing#pricing"
  end
  
  constraints subdomain: "app" do
    get "signin", to: "sessions#new"
    post "signin", to: "sessions#create"
    delete "signout", to: "sessions#destroy"
  
    get "signup", to: "users#new"
    post "signup", to: "users#create"
    
    patch "active_label", to: "active_labels#update"
  
    resources :trips, shallow: true do
      resources :days
      resources :transportations
      resources :activities
      resources :lodgings
      resources :sometimes
      resources :summaries, module: 'trips', only: [:index]
    end
  
    # Defines the root path route ("/")
    #root "trips#index"
  end
  
  get "/404", to: "errors#not_found"
  get "/500", to: "errors#server_error"
  get "/422", to: "errors#unprocessable"
end
