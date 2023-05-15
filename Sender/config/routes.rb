Rails.application.routes.draw do
  resources :students
  root 'dashboard#index'
  devise_for :users


  namespace :api do
    namespace :v1 do
      resources :student do
        member do
          get :other_info
          get :info
        end
      end
    end
  end
end
