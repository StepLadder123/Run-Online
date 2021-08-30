Rails.application.routes.draw do
  root to: "scores#index"
  devise_for :users
  resources :scores, only: [:index, :new, :create, :show, :destroy] do
    collection do
      get 'search'
      get 'list'
    end
    resources :comments, only: :create
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
