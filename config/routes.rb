Rails.application.routes.draw do

  devise_for :users
  root to: 'movies#index'
  resources :movies, only: %i[show] do
    member do
      resources :seats, only: %i[index]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
