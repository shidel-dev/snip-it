Codetrest::Application.routes.draw do
  get 'login',  to: 'sessions#login_forms'
  post 'login', to: 'sessions#login'
  get 'logout', to: 'sessions#logout'
  post 'signup', to: 'sessions#signup'
end
