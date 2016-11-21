Rails.application.routes.draw do
  devise_for :users,
             :controllers => { :sessions => "new_devise/sessions" }
  resources :pictures,   only: [:index, :show, :destroy]
  resources :categories, only: [:index, :show]
  resources :comments,   only: [:new, :create, :destroy, :index, :show]
  resources :users,      only: [:show, :index]
  resources :likes,      only: [:new, :create, :show]
  resources :events,     only: [:index, :show]

    resources :pictures do
      resources :comments
    end
    
  root 'pictures#index'

  

end
