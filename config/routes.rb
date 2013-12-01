Handraise::Application.routes.draw do

  resources :courses

  #get "sessions/create"
  #get "sessions/destroy"
  #get "site/start"
  root 'issues#index'

  get 'login' => 'sessions#new', as: :login
  get 'logout' => 'sessions#destroy', as: :signout  

  resources :issues do 
    resources :responses
  end

  get 'issues/:id/resolve' => 'issues#resolved', :as => 'resolve'
  get 'issues/:id/add_to_queue' => 'issues#add_to_queue', :as => 'add_to_queue'
  get 'issues/:id/remove_from_queue' => 'issues#remove_from_queue', :as => 'remove_from_queue'

  #resources :issues
  resources :users

  # OMNIAUTH
  get '/auth/github/' => redirect('/auth/github')
  get '/auth/github/callback', to: 'sessions#create'
  get '/auth/failure' => redirect('/')

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
