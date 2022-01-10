Rails.application.routes.draw do
  get  'dishes',        to: 'dishes#index'
  post 'dishes',        to: 'dishes#create'
  get  'dishes/new',    to: 'dishes#new'
  get  'dishes/:id',    to: 'dishes#show', as: 'dish'

  get  'menus',         to: 'menus#index'
  post 'menus',         to: 'menus#create'
  get  'menus/new',     to: 'menus#new'
  get  'menus/:id',     to: 'menus#show', as: 'menu'

  get 'json',           to: 'json#index'

  # Defines the root path route ("/")
  root "home#index"
end
