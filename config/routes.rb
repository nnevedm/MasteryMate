Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :experts, only: %i[index new create] do
    resources :expert_fields, only: [:new, :create]
    resources :requests, only: %i[new create]
  end
  resources :requests, only: %i[index], as: "my_requests"
  resources :requests, only: %i[show]
end
