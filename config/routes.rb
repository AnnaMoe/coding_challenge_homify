Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "campaigns#index"
  resources :campaigns, only: [:index, :show, :new, :create] do
    resources :comments, only: [:new, :create ]
    resources :todos, only: [:new, :show, :create ] do
      resources :comments, only: [:new, :create ]
    end
  end
  resources :users, only: [:index, :edit, :update]
end
