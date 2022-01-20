# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ApplicationConcern
  include ExceptionHandler
end
