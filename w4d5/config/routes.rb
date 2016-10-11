Rails.application.routes.draw do


  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :subs do
    resources :posts
  end

  resources :posts, except: [:index, :create, :new, :edit, :show, :destroy, :update] do
    resources :comments, except: [:index]
  end

end
