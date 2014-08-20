Rails.application.routes.draw do
  devise_for :users, controllers: { :sessions => "sessions" }
  root to: 'home#index'

  namespace :api do
    namespace :v1 do
      resources :profiles do
        member do
          get :next_profile
          get :prev_profile
        end
      end
      resources :default_messages
      resources :canned_messages do
        member do
          post :save_defaults
          get :save_defaults
        end
      end
      resources :folders
      resources :gmail_accounts
      resources :messages
    end
  end
end
