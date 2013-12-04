  Handraise::Application.routes.draw do

  resources :courses do 
    resources :issues, :controller => 'course/issues', except: [:index]
  end

  post 'courses/:course_id/issues/:id/queue' => 'course/issues#queue_item', as: 'queue_item'


  get 'courses/:course_id/issues/:id/resolve' => 'course/issues#resolve', :as => 'resolve_issue'
  post 'courses/:course_id/issues/:id/response' => 'responses#create', :as => 'add_response'
  
  get 'courses/:course_id/issues/:id/add_to_queue' => 'course/issues#add_to_queue', :as => 'add_to_queue'
  get 'courses/:course_id/issues/:id/remove_from_queue' => 'course/issues#remove_from_queue', :as => 'remove_from_queue'

  get 'add_primary_course' => 'courses#add_primary_course'
  get 'remove_primary_course' => 'courses#remove_primary_course'

  get 'courses/:course_id/archive' => 'courses#show_archive', :as => 'show_archive'

  get 'add-admin' => 'site#new_admin'
  post 'add-admin' => 'site#create_admin'

  get "sessions/create"
  get "sessions/destroy"
  get "site/start"
  root 'courses#index'

  get 'login' => 'sessions#new', as: :login
  get 'logout' => 'sessions#destroy', as: :signout  

  
  # OMNIAUTH
  get '/auth/github/' => redirect('/auth/github')
  get '/auth/github/callback', to: 'sessions#create'
  get '/auth/failure' => redirect('/')

end
