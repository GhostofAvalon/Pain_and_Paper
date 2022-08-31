Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :rooms do
    resources :characters, except: %i[edit]
  end
  get 'character/:id/race', to: 'pages#display_race', as: 'set_race'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
