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

  root 'movies#index'
end
