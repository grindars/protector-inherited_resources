Rails.application.routes.draw do
  resources :dummies
  resources :derived
  resources :nil
  resources :optout
  resources :custom_user
end
