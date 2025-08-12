Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  resources :restaurants, only: [:create, :index, :destroy]

# VERB  URL, to: "controller#action"
  # get "restaurants", to: "restaurants#index"   # page to see all restaurants
  # get "restaurants/new", to: "restaurants#new" # page to see the form for a new restaurant
  # get "restaurants/:id", to: "restaurants#show", as: :restaurant  # page to see one restaurant
  # post "restaurants", to: "restaurants#create" # request sending new restaurant info
  # get "restaurants/:id/edit", to: "restaurants#edit" # page to see the editing form for restaurant with specific id
  # patch "restaurants/:id", to: "restaurants#update"  # request sending updated info for chosen restaurant
  # delete "restaurants/:id", to: "restaurants#destroy" # request to delete a specific restaurant
end
