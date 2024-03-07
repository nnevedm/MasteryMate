Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :experts, only: %i[index new create] do
    resources :requests, only: %i[new create]
  end
  resources :requests, only: :index, as: :my_requests
  resources :requests, only: %i[show]
end
