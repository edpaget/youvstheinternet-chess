WebChess::Application.routes.draw do
  resources :games

  match '/auth/:provider/callback', to: 'sessions#create'
  root :to => 'games#index'
end
