Rails.application.routes.draw do
  resources :birds
  resources :birdcats
  resources :people
  resources :places
  resources :observations
end
