Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users,
             :controllers => { :sessions =>           "new_devise/sessions", 
                               :omniauth_callbacks => "omniauth_callbacks",
                               :registrations =>               "new_devise/registrations" }
                               
             
  resources :pictures,   only: [:index, :show, :destroy, :new, :create, :subscribe]
  resources :categories, only: [:index, :show]
  resources :comments,   only: [:new, :create, :destroy, :index, :show]
  resources :users,      only: [:show, :index, :destroy, :create]
  resources :likes,      only: [:new, :create, :show]
  resources :services,   only: [:index, :create]

    resources :pictures do
      resources :comments
    end
    
  root 'pictures#index'

  get '/users/:id/events' => 'events#index'
  get '/events'           => 'users#index'
  get '/subscribe'        => 'pictures#subscribe'

end
