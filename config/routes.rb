Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :experts, only: [:index, :new, :create] do
    resources :expert_fields, only: [:new, :create]
    resources :requests, only: [:new, :create]
  end
  resources :requests, only: :index, as: :my_requests
  resources :requests, only: %i[show]
end
