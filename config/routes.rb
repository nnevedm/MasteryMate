Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :experts, only: %i[index new create] do
    # resources :expert_fields, only: %i[new create]
    # I think we can delete the above line
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

  patch "cancel/:id", to: "requests#cancel", as: "request_cancelled"
  patch "reject/:id", to: "requests#reject", as: "request_rejected"
end
