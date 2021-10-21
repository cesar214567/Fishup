Rails.application.routes.draw do
  %w( 404 422 500 503 ).each do |code|
    get code, :to => "errors#show", :code => code
  end
  devise_for :users

  resources :posts, only: [:index,:show]

  root to: 'pages#home'
  resources :spots, only: %i[index show new create edit update] do
    resources :posts, only: %i[new create]
    resources :liked_spots, only: [:create,:destroy]
    resources :voted_spots, only: [:create,:destroy]
    resources :catch_spots, only: [:new,:create]
  end
  #  resources :catches, only: %i[index]
  resources :catch_spots, only: [] do
    resources :verify_catch_spots, only: :create
  end
  resources :catches, only: %i[show index]
  resources :baits
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
