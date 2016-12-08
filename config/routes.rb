Rails.application.routes.draw do

  # get 'project', :to => 'projects#index', :as => 'project'

  get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  resources :users do
    member do
      get :delete
    end
  end

  resources :projects do
    member do
      get :delete
    end
  end

  resources :tasks do
    member do
      get :delete
    end
  end

  get 'demo/index'
  # if Rails.env.production?
    get '404', :to => 'application#page_not_found'
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
