Rails.application.routes.draw do
 
  get 'welcome/about', to: 'welcome#about', as: :about

  resources :reviews
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :movies do
    collection do
        get 'search'
    end
    resources :reviews
  end

  match 'auth/:provider/callback', to: 'sessions#create', :via => [:get]
  match 'auth/failure', to: redirect('/'), :via => [:get]
  match 'signout', to: 'sessions#destroy', as: 'signout', :via => [:get]

  root 'movies#index'
end
