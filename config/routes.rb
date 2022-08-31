Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get 'character/:id/race', to: 'pages#races_index', as: 'set_race'

  resources :rooms do
    resources :characters, except: %i[edit]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
