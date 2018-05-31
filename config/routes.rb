Rails.application.routes.draw do
  resources :plays
  resources :games
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'plays/save_my_play', to: 'plays#save_my_play'

  root 'games#index'
end
