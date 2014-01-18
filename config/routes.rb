PixelMob::Application.routes.draw do
  get "user/index"
  #ActiveAdmin.routes(self)
  devise_for :users, :controllers => { :sessions => "sessions",:registrations => "registrations",:omniauth_callbacks => "api/user" }, :sign_out_via => [ :post, :delete ]
  namespace :api do
    resources :videos do
  		collection do
			post 'update/:id' => 'videos#update'
			post ':id/upVote' => 'videos#upVote'
			post ':id/downVote' => 'videos#downVote'
      post 'watch' => 'videos#watch'
      get 'autocomplete' => 'videos#search_autocomplete'
      get 'lastpage', to:  'videos#lastPage', :module => :api
      get 'liveProgress/:id', to: 'videos#liveProgress', :module => :api
		end
		end
    get 'user/launchkey/:username' => "user#launchkey", :module => :api
    post 'user/launchkey/callback' => 'user#launchkey_callback', :module => :api
  	resources :comments
		resources :games
		resources :tags
  	resources :user do
  		collection  do
				post 'unsubscribe/:id' => 'user#unsubscribe', :module => :api
				post 'subscribe/:id' => 'user#subscribe', :module => :api
				get 'subscriptions/videos' => 'user#subscriptions_videos', :module => :api
				get 'current_user' => 'user#current', :module => :api
        post 'clefSignout' => 'user#logout_clef', :module => :api
			end 
		end
		resources :channels
  end
  require 'sidekiq/web'
mount Sidekiq::Web => '/sidekiq'

	root :to => 'ember#index'
  get '*path' => 'ember#index'
  #devise_for :users,
 
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
