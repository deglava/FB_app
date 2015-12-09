Rails.application.routes.draw do

  get 'dashboard/viewmsg'
  post 'dashboard/viewmsg'
  get 'dashboard/addcomment'
  post 'dashboard/addcomment'
  get 'dashboard/submitmsg'
  post 'dashboard/submitmsg'
  get 'dashboard/addevent'
  post 'dashboard/addevent'
  get 'dashboard/viewtimeline'
  post 'dashboard/viewtimeline'
  get 'friendship/destroy'
  post 'friendship/destroy'
  get 'dashboard/unfriend'
  post 'dashboard/unfriend'
  get 'dashboard/sendmessage'
  post 'dashboard/sendmessage'
  get 'dashboard/viewFriends'
  post 'dashboard/viewFriends'
  get 'dashboard/search'
  get 'dashboard/results'
  post 'dashboard/results'
  get 'dashboard/home'
  post 'dashboard/home'
  get 'dashboard/viewguest'
  get 'dashboard/addfriend'
  get 'home/index' => 'home'
  get 'home/about' => 'about'
  get 'dashboard/profile2'
  post 'dashboard/profile2'
  post 'dashboard/viewguest'
  post 'dashboard/addfriend'
  get 'dashboard/changeStatus'
  post 'dashboard/changeStatus'
  resources :friendships
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :dashboard
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
