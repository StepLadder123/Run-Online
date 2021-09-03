Rails.application.routes.draw do
  root to: "scores#index"
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :scores, only: [:index, :new, :create, :show, :destroy] do
    collection do
      get 'search'
      get 'list'
      get 'rank'
    end
    resources :comments, only: :create
    resources :courses, only: [:new, :create, :destroy] do
      get 'challenge'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
