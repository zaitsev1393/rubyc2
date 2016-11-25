Rails.application.routes.draw do
  devise_for :users,
             :controllers => { :sessions => "new_devise/sessions", :omniauth_callbacks => 'omniauth_callbacks' }
             
  resources :pictures,   only: [:index, :show, :destroy, :new, :create]
  resources :categories, only: [:index, :show]
  resources :comments,   only: [:new, :create, :destroy, :index, :show]
  resources :users,      only: [:show, :index, :destroy]
  resources :likes,      only: [:new, :create, :show]
  resources :events,     only: [:index, :show]
  resources :services,   only: [:index, :create]

    resources :pictures do
      resources :comments
    end
    
  root 'pictures#index'

   get "modal" => "pictures#modal_picture", as: 'modal'
end
