Rails.application.routes.draw do
  root to: "scores#index"
  devise_for :users
  resources :scores
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
