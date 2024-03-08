Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :experts, only: %i[index new create] do
    resources :expert_fields, only: [:new, :create]
    # is the above line needed? I thought we deleted it?
    resources :requests, only: %i[new create] do
      resources :offers, only: %i[create]
    end
  end

  # this is for "my requests", the index of user's request
  resources :requests, only: %i[index], as: "my_requests"

  # this is for "my requests", the show page of user's request
  resources :requests, only: %i[show]

  # this is for "requests received", the index of all requests an expert received
  get "requests_received", to: "requests#requests_received"

  # this is for "requests received", the show of each request an expert received
  get "requests_received/:id", to: "requests#requests_received_show", as: "request_received"

end
