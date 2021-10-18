Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :spots, only: %i[index show new create edit update]
  #  resources :catches, only: %i[index]

  resources :catches, only: %i[show index]
  resources :baits
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
