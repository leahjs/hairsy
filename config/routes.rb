Rails.application.routes.draw do
  root :to => 'homepage#landing'
  
  get 'sessions/new', as: :signin, path: :signin
  post 'sessions/create', as: :attempt_signin
  get 'sessions/destroy', as: :signout, path: :signout
  get 'users/new', as: :signup, path: :signup

  resources :users, :except => [:destroy, :index] do
    member do
      post 'update_email', path: :update_email
    end
  end
end
