# frozen_string_literal: true

module ApplicationConcern
  extend ActiveSupport::Concern

  included do
    attr_reader :current_user

    before_action :authorize_api_request!, only: %i[create update destroy]
  end

  private

  def authorize_api_request!
    @current_user = ApiRequest.new(request.headers).authorize!
    raise UnauthorizedException unless @current_user
  end

  # resource can be either post, comment, reply
  def check_user_permission_for(resource)
    raise UnpermittedException if @current_user.id != resource.user_id

    raise LocalJumpError, 'block is not given to execute' unless block_given?

    yield(resource)
  end
end

class UnpermittedException < StandardError; end
class UnauthorizedException < StandardError; end
class CommentNotFoundException < StandardError; end
class PostNotFoundException < StandardError; end
class InvalidTokenException < StandardError; end
