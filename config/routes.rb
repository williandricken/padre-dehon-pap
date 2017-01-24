Rails.application.routes.draw do
  resources :employees
  devise_for :users
  resources :diseases
  resources :responsibles
  resources :behaviors
  resources :students
  resources :campaigns
  resources :emails

  get '/templates/:id' , to: 'emails#template', as: :template

  # get '/students/:id' , to: 'students#quick_info', as: :quick_info
  # get '/students/' , to: 'students#index', as: :students
  # get '/students/:id' , to: 'students#edit', as: :edit_student

  #get '/sms', to: 'sms#index'
  #post 'sms/send' => 'sms#send'

  root 'emails#index'
  #post 'email/create_campaign' => 'email#create_campaign'


  #root to: 'pages#home'
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