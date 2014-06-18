Rails.application.routes.draw do

  devise_for :users
  resources :event_types
  resources :events do
    resources :resonses
  end
  resources :locations
  resources :people do
    resources :responses do
    put :update_responses
  end
  end
  resources :event_groups
  resources :event_users do
    resources :responses do
    put :update_responses
  end
  end
  resources :responses do
    collection do
      post :batch_update
    end
  end
  resources :uploads
  resources :playbooks
  resources :forms do
    resources :form_submissions do
      resources :form_submission_items
    end
    resources :form_fields do
      resources :form_submission_items
    end
  end
  # :update_responses => :put


  root :to => "landing#index"


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
