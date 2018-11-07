# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, skip: :all # This makes devise_scope available.

  # scope :api, defaults: {format: :json} do
  #   devise_for :users,
  #     path: "v1",
  #     path_names: {
  #       registration: 'sign_up',
  #       sign_in: 'sign_in',
  #       sign_out: 'sign_out',
  #       password: 'secret',
  #       confirmation: 'verification',
  #       unlock: 'unblock',
  #     },
  #     controllers: {
  #       sessions: 'api/v1/users/sessions',
  #       registrations: 'api/v1/users/registrations'
  #     }
  # end

  namespace :api do
    namespace :v1 do
      resources :countries, only: %i[index create show update]
      resources :currencies, only: %i[index create show update]

      devise_scope :user do
        get "current_user", to: "api#current_user"
        # User Sign Up
        post "sign_up", to: "users/registrations#create"
        # get "sign_up_cancel", to: "users/registrations#cancel"
        # User Update/Delete
        patch "users", to: "users/registrations#update"
        put "users", to: "users/registrations#update"
        delete "users", to: "users/registrations#destroy"
        # User Sign In/Out
        post "sign_in", to: "users/sessions#create"
        # delete "sign_out", to: "users/sessions#destroy"
        # User Password Management
        post "users/password", to: "users/passwords#create"
        patch "users/password", to: "users/passwords#update"
        put "users/password", to: "users/passwords#update"
      end

    end
  end
end
