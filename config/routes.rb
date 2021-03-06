Rails.application.routes.draw do
  

  #root to: 'recommendation#index'
  #root to: 'brightcoverecommendation#index'


  root to: "bright_cove_recommendation#index"

  resources :trackings

  resources :recommendation

  #resources 'bright_cove_recommendation'

  # namespace :brightcove do
  #   #resources :recommendation#, param: :url, only: :show, path: "" # -> domain.com/embed/1
  #   get 'recommendations', to: 'bright_cove_recommendation#index'
  #   post 'fetch_recommendations', to: 'bright_cove_recommendation#fetch_recommendations'
  # end

  namespace :embed do
    #resources :recommendation#, param: :url, only: :show, path: "" # -> domain.com/embed/1
    get '', to: 'recommendation#show'
  end

  namespace :embedvideo do
    #resources :recommendation#, param: :url, only: :show, path: "" # -> domain.com/embed/1
    get '', to: 'bright_cove_recommendation#show'
  end
  
  match 'fetch_recommendations', to: 'recommendation#fetch_recommendations', via: [:post]

  match 'bright_cove_fetch_recommendations', to: 'bright_cove_recommendation#fetch_recommendations', via: [:post]

    
  ##For User authentication
  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout

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
