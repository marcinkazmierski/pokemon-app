Rails.application.routes.draw do
  resources :images
  resources :pokemons
  get 'home/index'
  root 'home#index'

  get 'pokemons-all', to: 'pokemons#all'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
