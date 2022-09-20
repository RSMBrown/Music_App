Rails.application.routes.draw do
  root "artists#index"
  resources :artists
  resources :albums
  resources :songs do 
    resources :ratings 
  end
  get "/genre_sort", to: "albums#genre_sort"
  get "/year_sort", to: "albums#year_sort"

end
