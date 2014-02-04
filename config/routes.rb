DuckingNinja::Application.routes.draw do

  root "home#index"

  resources :holidays

  #Static pages
  scope "/" do

    scope :agent do
      get "home", :to => "agent/home#index", :as => :agent_dashboard
    end

    get "about", :to => "static_pages#about", :as => :about
    get "faq", :to => "static_pages#faq", :as => :faq
    get "privacy", :to => "static_pages#privacy", :as => :privacy
    get "terms", :to => "static_pages#terms", :as => :terms    
  end


  #Users
  devise_for :travellers 
  devise_for :agents

  devise_scope :traveller do
    get :login, :to => "devise/sessions#new"
    delete :logout, :to => "devise/sessions#destroy"
  end

  devise_scope :agent do
    get :agent_login, :to => "devise/sessions#new"
    delete :agent_logout, :to => "devise/sessions#destroy"
  end

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
