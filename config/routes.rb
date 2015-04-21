Rails.application.routes.draw do

	get 'yadavarezekrs/zekr_id' => 'yadavarezekrs#index', as: 'zekr_yadavarezekrs'
  resources :yadavarezekrs
	get 'yadavarenamazs/namaz_id' => 'yadavarenamazs#index', as: 'namaz_yadavarenamazs'
  resources :yadavarenamazs
	get 'yadavars/user_id' => 'yadavars#index', as: 'user_yadavars'
  resources :yadavars
	get 'zekrs/user_id' => 'zekrs#index', as: 'user_zekrs'
  resources :zekrs
	get 'ruzes/user_id' => 'ruzes#index', as: 'user_ruzes'
  resources :ruzes
	get 'namazs/user_id' => 'namazs#index', as: 'user_namazs'
  resources :namazs

  get 'home/index'

  resources :profiles

  resources :mohrs

  devise_for :users

  root to: "home#index"



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
