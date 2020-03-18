Rails.application.routes.draw do
  resources :song_collections
  resources :collections
  resources :resources
  resources :song_categories
  resources :categories
  resources :songs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
