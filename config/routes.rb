Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :offers do 
    get "/bookings", to: "bookings#index"
  end
  resources :bookings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/dashboard", to: "pages#dashboard", :as => :user_root
  get "/profile", to: "pages#profile"
  get "/ride_history", to: "pages#ride_history"
end
