DuckingNinja::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
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
      get :pitch, on: :member
      resources :pitches, :except => [:new,:index]
    end
    resources :pitches, :only => :index
  end
   
  ###############
  #
  # Users
  #
  ###############
  devise_for :travellers, controllers: { registrations: "traveller/registrations", sessions: "traveller/sessions" } 
  devise_for :agents, controllers: { registrations: "agent/registrations", sessions: "agent/sessions" }

 end
