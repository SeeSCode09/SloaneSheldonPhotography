Rails.application.routes.draw do
  root 'countries#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :countries, only: [:index]
  resources :africa_photos, only: [:new, :index, :show]
  resources :asia_photos, only: [:index, :show]

end
