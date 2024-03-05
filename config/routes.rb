Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :experts, only: [:index, :new, :create]
end
