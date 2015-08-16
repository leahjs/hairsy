Rails.application.routes.draw do
  root 'hompage#landing'
  get 'sessions/new', as: :signin, path: :signin
  post 'sessions/create', as: :attempt_signin
  get 'sessions/destroy', as: :signout, path: :signout
  get 'users/new', as: :signup, path: :signup

  resources :users, :except => [:destroy, :index] do

  end
end
