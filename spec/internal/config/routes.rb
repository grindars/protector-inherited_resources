Rails.application.routes.draw do
  resources :dummies
  resources :derived
  resources :optout
  resources :custom_user
end
