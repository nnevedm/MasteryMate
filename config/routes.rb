Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :experts, only: %i[index new create] do
    resources :requests, only: %i[new create] do
      resources :offers, only: %i[create update] do
        resources :reviews, only: %i[new create]
      end
    end
  end

  # this is for "my requests", the index of user's request
  resources :requests, only: %i[index], as: "my_requests"

  # this is for "my requests", the show page of user's request
  resources :requests, only: %i[show] do
    resources :messages, only: :create
    patch "/offers/accept/:id", to: "offers#accept", as: "offer_accepted"
    patch "/offers/decline/:id", to: "offers#decline", as: "offer_declined"
  end

  # this is for "requests received", the index of all requests an expert received
  get "requests_received", to: "requests#requests_received"

  # this is for "requests received", the show of each request an expert received
  get "requests_received/:id", to: "requests#requests_received_show", as: "request_received"

  patch "reject/:id", to: "requests#reject", as: "request_rejected"
  delete "requests_rejected/:id", to: "requests#destroy_rejected_request", as: "destroy_rejected_request"

  patch "cancel/:id", to: "requests#cancel", as: "request_cancelled"
  delete "requests_cancelled/:id", to: "requests#destroy_cancelled_request", as: "destroy_cancelled_request"
end
