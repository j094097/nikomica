Rails.application.routes.draw do

  

  resources :posts, only: [:index, :show, :create]

  devise_for :users

  resources :users do
    resources :posts
  end

  root to: "sites#index"
  
end
