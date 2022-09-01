Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :characters, only: %i[update]

  resources :rooms do
    resources :characters, only: %i[show create index new destroy]
  end

  resources :characters, only: %i[show] do
    resources :races, only: %i[show index]
    resources :jobs, only: %i[show index]
    resources :backgrounds, only: %i[show index]
    resources :characteristics_lists, only: %i[edit update]
    resources :skills, only: %i[index update]
    resources :gifts, only: %i[index update]
    resources :spells, only: %i[index update]
  end



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
