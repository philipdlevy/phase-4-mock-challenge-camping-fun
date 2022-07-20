Rails.application.routes.draw do
  resources :activities, only: [:index]
  resources :campers, only: [:index, :show, :create]
  resources :signups, only: [:create]
end
