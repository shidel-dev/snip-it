Codetrest::Application.routes.draw do
  get 'login',  to: 'sessions#login_forms'
  post 'login', to: 'sessions#login'
  get 'logout', to: 'sessions#logout'
  post 'signup', to: 'sessions#signup'

  get 'users/:id/boards', to: 'users#list_boards'

  post 'search', to: 'searches#search'

  resources 'users'
  resources 'snipits'
end
