Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :spots, only: %i[index show new create edit update]
  resources :catches, only: %i[index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
