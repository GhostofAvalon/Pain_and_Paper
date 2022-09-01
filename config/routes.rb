Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :rooms do
    resources :characters, only: %i[show create index new]
  end

  resources :characters, only: %i[show] do
    resources :skills, only: %i[index update]
    resources :gifts, only: %i[index update]
    resources :spells, only: %i[index update]
    resources :races
  end



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
