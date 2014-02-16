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

  resources :holidays, :controller => "traveller/holidays" do
    resources :pitches, :only => :show, :controller => "traveller/pitches" do
      patch "update_status", :on => :member
    end
  end
  

  namespace :agent do
    root "home#index"
    resource :agent_details, :only => [:show, :edit, :update], :as => :detail
    resources :holidays, :only => [:index, :show] do
      resources :pitches, :except => :index
    end
    resources :pitches, :only => :index
  end
   
  ###############
  #
  # Users
  #
  ###############
  devise_for :travellers 
  devise_for :agents

 end
