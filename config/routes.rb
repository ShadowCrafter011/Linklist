Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "home#index"

  scope :list do
    get "create", to: "link_list#new", as: "new_list"
    put "create", to: "link_list#create"
    scope ":link_list_id" do
      get "/", to: "link_list#show", as: "list"
      get "add", to: "link_list#new_link", as: "list_add_link"
      put "add", to: "link_list#create_link"
      delete ":destroy_token", to: "link_list#destroy", as: "destroy_list"
    end
  end
end
