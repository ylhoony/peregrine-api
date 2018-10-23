Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :countries, only: [:index, :create, :show, :update]
      resources :currencies, only: [:index, :create, :show, :update]
    end
  end

end
