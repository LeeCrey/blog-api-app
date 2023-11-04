# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  protect_from_forgery with: :null_session
  respond_to :json

  include RegistrationsConcern
end
