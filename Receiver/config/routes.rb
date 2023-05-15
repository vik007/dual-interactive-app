Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post :designations, to: 'designations#index'
    end
  end
end
