Rails.application.routes.draw do

  match '/dashfeed/:feed_id', :action => 'dashfeed', :via => [:get], :controller => 'dashboards', as: :dashfeed
  match '/markall/:feed_id', :action => 'markall', :via => [:get], :controller => 'dashboards', as: :markall
  match '/grid/:feed_id', :action => 'grid', :via => [:get], :controller => 'dashboards', as: :grid

  resources :dashboards, only: [:index]

  resources :users

  resources :feeds do
    resources :entries, only: [:show, :index]
  end

  get 'signin' => 'sessions#new'
  resource :session

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  get 'signup' => 'users#new'

  root "static#index"

end
