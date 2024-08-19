Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "wo_lists#index"

  resources :wo_lists, except: :show do
    collection do
      post :import
      patch :clear_all
    end
  end
  
  
  resources :productions, except: :show do
    member do
      patch :mark_complete
    end
  end
  
   
end
