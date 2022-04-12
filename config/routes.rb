Rails.application.routes.draw do

  devise_for :users
  root to: 'movies#index'
  resources :movies, only: %i[show]
  resources :line_items, only: %i[new]

  resources :exibithions, only: [] do
    resources :line_items, only: :create
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
