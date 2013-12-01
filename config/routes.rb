Handraise::Application.routes.draw do

  resources :courses do 
    resources :issues, :controller => 'course/issues', except: [:index]
  end

  get 'courses/:course_id/issues/:id/resolve' => 'course/issues#resolve', :as => 'resolve_issue'
  post 'courses/:course_id/issues/:id/response' => 'responses#create', :as => 'add_response'
  
  get 'add-admin' => 'site#new_admin'#, :as => 'admin'
  post 'add-admin' => 'site#create_admin'#, :as => 'create_admin'

  get "sessions/create"
  get "sessions/destroy"
  get "site/start"
  root 'courses#index'

  get 'login' => 'sessions#new', as: :login
  get 'logout' => 'sessions#destroy', as: :signout  

  #resources :issues
  # resources :users

  # OMNIAUTH
  get '/auth/github/' => redirect('/auth/github')
  get '/auth/github/callback', to: 'sessions#create'
  get '/auth/failure' => redirect('/')

end
