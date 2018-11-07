# frozen_string_literal: true

Rails.application.routes.draw do
  scope :api, defaults: {format: :json} do
    devise_for :users,
      path: "v1",
      path_names: {
        registration: 'sign_up',
        sign_in: 'sign_in',
        sign_out: 'sign_out',
        password: 'secret',
        confirmation: 'verification',
        unlock: 'unblock',
      },
      controllers: {
        sessions: 'api/v1/users/sessions',
        registrations: 'api/v1/users/registrations'
      }
  end

  namespace :api do
    namespace :v1 do
      resources :countries, only: %i[index create show update]
      resources :currencies, only: %i[index create show update]
    end
  end
end
