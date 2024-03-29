ActionController::Routing::Routes.draw do |map|


   map.connect '', :controller => 'recipes'

   map.resources :users , :collection => { :setlayout => :get, :setcss => :get }, :member => { :enable => :put } do |users|
         users.resource :account
         users.resources :roles
         users.resources :movies
         users.resources :programs
         users.resources :roles
   end

   map.resources :roles, :collection => { :setlayout => :get, :setcss => :get }
   #map.resources :pages, :collection => { :setlayout => :get, :setcss => :get }

   map.resources :categories, :collection => { :setlayout => :get, :setcss => :get } do |categories|
       categories.resources :movies
       categories.resources :recipes
   end

   map.resources :movies, :collection => { :setlayout => :get, :setcss => :get } do |movies|
     movies.resources :categories
     movies.resources :locations
   end

   map.resources :locations, :collection => { :setlayout => :get, :setcss => :get } do |locations|
       locations.resources :movies
   end

   map.resources :programs, :collection => { :setlayout => :get, :setcss => :get }


   map.resources :recipes, :collection => { :setlayout => :get, :setcss => :get } do |recipes|
       recipes.resources :ingrediences
   end

   map.resources :ingrediences, :collection => { :setlayout => :get, :setcss => :get } do |ingrediences|
       ingrediences.resources :recipes
       ingrediences.resources :lists
   end

   map.resources :meals, :collection => { :setlayout => :get, :setcss => :get } do |meals|
       meals.resources :recipes
   end

   map.resources :purchases, :collection => { :setlayout => :get, :setcss => :get }
   map.resources :lists, :collection => { :setlayout => :get, :setcss => :get } do |lists|
       lists.resources :ingrediences
   end

   map.signup '/signup', :controller => 'users', :action => 'new'
   map.login '/login', :controller => 'sessions', :action => 'new'
   map.logout '/logout', :controller => 'sessions', :action => 'destroy'
   map.activate '/activate/:id', :controller => 'accounts', :action => 'show'
   map.forgot_password '/forgot_password', :controller => 'passwords', :action => 'new'
   map.reset_password '/reset_password/:id', :controller => 'passwords', :action => 'edit'
   map.change_password '/change_password', :controller => 'accounts', :action => 'edit'
  # The priority is based upon order of creation: first created -> highest priority.

  map.resource :password
  map.resource :session
  map.resource :sessions

  map.resources :feeds, :collection => { :sort => :post }
  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
