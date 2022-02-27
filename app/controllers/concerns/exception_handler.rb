# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from UnpermittedException, with: :unpermitted_exception
    rescue_from UnauthorizedException, with: :unauthorized_exception
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from CommentNotFoundException, with: :comment_not_found
    rescue_from PostNotFoundException, with: :post_not_found
    rescue_from InvalidTokenException, with: :invalid_token_exception
    rescue_from ActiveSupport::MessageEncryptor::InvalidMessage, with: :invalid_token_exception
  end

  private

  # Handlers
  def unpermitted_exception
    render json: { error: 'Forbidden' }, status: :forbidden
  end

  def invalid_token_exception
    render json: { error: 'Invalid authorization token' }, status: :unauthorized
  end

  def post_not_found
    render json: { error: 'Post not found' }, status: :not_found
  end

  def comment_not_found
    render json: { error: 'Comment not found' }, status: :not_found
  end

  def record_invalid
    render json: { error: 'Invalid data' }, status: :unprocessable_entity
  end

  # responses
  def unauthorized_exception
    render json: { error: 'Unauthorized request' }, status: :unauthorized
  end
end
