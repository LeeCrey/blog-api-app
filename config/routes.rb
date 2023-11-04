# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             path_names: {
               sign_in: :login,
               sign_up: :register,
               sign_out: :logout,
             },
             controllers: {
               sessions: "users/sessions",
               registrations: "users/registrations",
               passwords: "users/passwords",
               unlocks: "users/unlocks",
             }

  resources :posts do
    resources :comments, shallow: true
  end
end
