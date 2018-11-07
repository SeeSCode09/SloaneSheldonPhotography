Rails.application.routes.draw do
  root 'countries#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :bio, only: [:index]

  resources :countries, only: [:index]
  resources :africa_photos, only: [:index, :new, :show, :create, :update, :destroy, :edit]
  resources :asia_photos, only: [:index, :new, :show, :create, :update, :destroy, :edit]
  resources :north_america_photos, only: [:index, :new, :show, :create, :update, :destroy, :edit]

end
