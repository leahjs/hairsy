Rails.application.routes.draw do

  get 'sessions/new', path: :login, as: :login

  post 'sessions/create', as: :attempt_login

  get 'sessions/destroy', path: :logout, as: :logout

  get 'users/new', path: :signup, as: :signup

  resources :users, :except => [:new, :index]


end
