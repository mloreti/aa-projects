Rails.application.routes.draw do
  resources :contacts, only: [:show, :create, :destroy, :update]
  resources :users, only: [:index, :show, :create, :destroy, :update] do
    resources :contacts, only: [:index]
  end
  resources :contact_shares, only: [:create, :destroy]

end
