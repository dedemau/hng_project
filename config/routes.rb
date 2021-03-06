Rails.application.routes.draw do
  resources :notifies
  resources :gvg_cores do
    collection do
      post 'invite_core'
      get 'accept_core'
      get 'reject_core'
    end
  end

  devise_for :users, :controllers => {:registrations => "registrations", :sessions => "sessions"}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  root to: "home#index"
  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  get 'sign_up' => 'members#sign_up'
  get 'gvgs' => 'midia_topics#gvgs'
  get 'gvgs/new_gvg' => 'midia_topics#new_gvg', as: :new_gvg
  get 'gvgs/:gvg_id/edit' => 'midia_topics#edit_gvg', as: :edit_gvg
  patch 'gvgs/update' => 'midia_topics#update_gvg', as: :update_gvg
  get 'gvgs/:gvg_id' => 'midia_topics#show_gvg', as: :show_gvg
  post 'gvgs/create_gvg' => 'midia_topics#create_gvg'
  delete 'gvgs/destroy' => 'midia_topics#destroy_gvg', as: :destroy_gvg
  post 'gvgs/create_comment' => 'midia_topics#create_comment', as: :create_comment
  patch 'update_comment' => 'midia_topics#update_comment', as: :update_comment
  delete 'destroy_comment'=> 'midia_topics#destroy_comment', as: :destroy_comment
  get 'recruitment' => 'members#recruitment'
  get 'requests' => 'members#requests'

  resources :events, only: [:index, :create, :update, :destroy] do
    collection do

    end
  end

  resources :itens, only: [:index] do
    collection do

    end
  end

  resources :members, only: [:index] do
    collection do
      get 'log_in'
      get 'accept_request'
      get 'kicked'
      patch 'refuse_request'
      get 'promote_member'
      get 'demote_member'
      get 'show_member'
    end
  end
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
