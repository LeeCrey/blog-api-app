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

  defaults format: :json do
    namespace :api do
      namespace :v1 do
        namespace :android do
          resources :posts, shallow: true do
            resources :comments
          end
        end
      end
    end
  end
end
