DuckingNinja::Application.routes.draw do

  ###############
  #
  # Static pages
  #
  ###############

  root "home#index"

  scope "/" do
    get "about", :to => "static_pages#about", :as => :about
    get "faq", :to => "static_pages#faq", :as => :faq
    get "privacy", :to => "static_pages#privacy", :as => :privacy
    get "terms", :to => "static_pages#terms", :as => :terms    
  end

  ###############
  #
  # REST routes
  #
  ###############

  resources :holidays
  namespace :agent do
    root "home#index"
  end
   
  ###############
  #
  # Users
  #
  ###############
  devise_for :travellers 
  devise_for :agents

 end
