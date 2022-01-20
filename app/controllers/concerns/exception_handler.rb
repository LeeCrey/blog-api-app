# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from UnpermittedException, with: :unpermitted_exception_handler
    rescue_from UnauthorizedException, with: :unauthorized_exception
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from CommentNotFoundException, with: :comment_not_found
    rescue_from PostNotFoundException, with: :post_not_found
    rescue_from InvalidTokenException, with: :invalid_token_exception_handler
  end

  private

  # Handlers
  def unpermitted_exception_handler
    render_error_response 'Forbidden', :forbidden
  end

  def invalid_token_exception_handler
    msg = 'Invalid authorization token'
    render_error_response msg, :unauthorized
  end

  def post_not_found
    msg = %(Post not found)
    render_error_response msg, :not_found
  end

  def comment_not_found
    msg = %(Comment not found)
    render_error_response msg, :not_found
  end

  def record_invalid
    render_error_response 'Invalid data', :unprocessable_entity
  end

  # responses

  def record_not_found
    render_error_response 'Not found', :not_found
  end

  def unauthorized_exception
    render_error_response 'Unauthorized Request', :unauthorized
  end

  ##
  def render_error_response(msg, status)
    render json: { error: msg }, status: status
  end
end
